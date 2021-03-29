module Api
  module V1
    class EnrollmentsController < ApplicationController
      include ExceptionTreatable

      # List enabled enrollments
      def index
        enrollments = Enrollment.where(enabled_enr: true)

        render json: { message: 'All enrollments loaded.', data: enrollments }, status: :ok
      end

      # List enrollments of a student
      def get_by_students
        student_id = params[:student_id]
        enrollments = Enrollment.joins(:student).where(student_id: student_id, enabled_enr: true)

        render json: { message: "Enrollments of student #{student_id} loaded.", data: enrollments }, status: :ok
      end

      # List enrollments of a institution
      def get_by_institutions
        institution_id = params[:institution_id]
        enrollments = Enrollment.joins(:institution).where(institution_id: institution_id, enabled_enr: true)

        render json: { message: "Enrollments of institution #{institution_id} loaded.", data: enrollments }, status: :ok
      end

      # List enabled and disabled enrollments
      def get_all
        enrollments = Enrollment.all

        render json: { message: 'All enrollments loaded. Enabled and Disabled.', data: enrollments }, status: :ok
      end

      # List disabled enrollments
      def get_disabled
        enrollments = Enrollment.where(enabled_enr: false)

        render json: { message: 'All disabled enrollments loaded.', data: enrollments }, status: :ok
      end

      # List specific enrollment by enrollment ID
      def show
        enrollment = Enrollment.find(params[:id])

        render json: { message: "Enrollment #{params[:id]} loaded.", data: enrollment }, status: :ok
      end

      # Create a new enrollment
      def create
        enrollment = Enrollment.new(enrollment_params)
        if enrollment.save
          bills = EnrollmentBillsCreate.perform(enrollment, enrollment_params)
          render json: { message: 'Registered enrollment and bills created.', data: enrollment }, status: :ok
        else
          render json: { status: 'ERRO', message: 'Not registered enrollment.', data: enrollment.errors }, status: :unprocessable_entity
        end
      end

      # Updates a enrollment
      def update
        id = params[:id]
        enrollment = Enrollment.find(id)
        enrollment.update_attributes(enrollment_params)

        if enrollment_params.empty?
          render json: { message: "Enrollment #{id} selected. Enter the parameters to be updated", data: enrollment }, status: :ok
        else
          render json: { message: "Enrollment #{id} updated.", data: enrollment }, status: :ok
        end
      end

      # Delete an enrollment
      def destroy
        ActiveRecord::Base.transaction do
          enrollment = Enrollment.find(params[:id])
          enrollment.update(enabled_enr: false)
          disable_bills(enrollment)

          render json: { message: "Enrollment #{params[:id]} deleted.", data: enrollment }, status: :ok
        end
      end

      # Checks whether parameters have been accepted
      private

      def enrollment_params
        params.permit(:institution_id, :student_id, :total_value, :due_day, :amount_bills, :course)
      end

      def not_found
        render json: { message: 'Error: Not Found. Enrollment Id does not exist.' }, status: :not_found
      end

      def disable_bills(enrollment)
        Bill.where(enrollment_id: enrollment.id).update_all(enabled_bill: false)
      end
    end
  end
end
