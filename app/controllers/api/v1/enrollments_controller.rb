module Api
  module V1
    class EnrollmentsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      # List enabled enrollments
      def index
        enrollments = Enrollment.where('enabled_enr = ?', true).order('id ASC')
        render json: { message: 'All enrollments loaded.', data: enrollments }, status: :ok
      end

      # List enrollments of a student
      def get_by_students
        params[:student_id]
        enrollments = Enrollment.joins(:student).where('student_id = ?', params[:student_id]).where('enabled_enr = ?', true).order('id ASC')
        render json: { message: "Enrollments of student #{params[:student_id]} loaded.", data: enrollments }, status: :ok
      end

      # List enrollments of a institution
      def get_by_institutions
        params[:institution_id]
        enrollments = Enrollment.joins(:institution).where('institution_id = ?', params[:institution_id]).where('enabled_enr = ?', true).order('id ASC')
        render json: { message: "Enrollments of institution #{params[:institution_id]} loaded.", data: enrollments }, status: :ok
      end

      # List enabled and disabled enrollments
      def get_all
        enrollments = Enrollment.order('id ASC')
        render json: { message: 'All enrollments loaded. Enabled and Disabled.', data: enrollments }, status: :ok
      end

      # List disabled enrollments
      def get_disabled
        enrollments = Enrollment.where('enabled_enr = ?', false).order('id ASC')
        render json: { message: 'All disabled enrollments loaded.', data: enrollments }, status: :ok
      end

      # List specific enrollment by enrollment ID
      def show
        enrollment = Enrollment.where('enabled_enr = ?', true).find(params[:id])
        render json: { message: "Enrollment #{params[:id]} loaded.", data: enrollment }, status: :ok
      end

      # Create a new enrollment
      def create
        enrollment = Enrollment.new(enrollment_params)
        if enrollment.save
          render json: { message: 'Registered enrollment.', data: enrollment }, status: :ok
        else
          render json: { status: 'ERRO', message: 'Not registered enrollment.', data: enrollment.errors }, status: :unprocessable_entity
        end
      end

      # Updates a enrollment
      def update
        id = params[:id]
        enrollment = Enrollment.where('enabled_enr = ?', true).find(id)
        enrollment.update_attributes(enrollment_params)
        if enrollment_params.empty?
          render json: { message: "Enrollment #{id} selected. Enter the parameters to be updated", data: enrollment }, status: :ok
        else
          # Disables bills with old parameters and creates new ones
          Bill.where('enrollment_id = ?', id).update_all(enabled_bill: false)

          enrollment = Enrollment.find(id)
          enrollment.create_bills
          render json: { message: "Enrollment #{id} updated.", data: enrollment }, status: :ok
        end
      end

      # Delete an enrollment
      def destroy
        ActiveRecord::Base.transaction do
          enrollment = Enrollment.where('enabled_enr = ?', true).find(params[:id])

          bills = Bill.where('enrollment_id = ?', params[:id]).update_all(enabled_bill: false)

          enrollment.update(enabled_enr: false)
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
    end
  end
end
