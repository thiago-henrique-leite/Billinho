module Api
  module V1
    class EnrollmentsController < ApplicationController
      # List enrollments in general
      def index
        enrollments = Enrollment.order('id ASC')
        render json: { message: 'All enrollments loaded.', data: enrollments }, status: :ok
      end

      # List enrollments of a student
      def index_by_students
        params[:student_id]
        enrollments = Enrollment.joins(:student).where('student_id = ?', params[:student_id]).order('id ASC')
        render json: { message: "Enrollments of student #{params[:student_id]} loaded.", data: enrollments }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Student Id does not exist.' }, status: :not_found
      end

      # List enrollments of a institution
      def index_by_institutions
        params[:institution_id]
        enrollments = Enrollment.joins(:institution).where('institution_id = ?', params[:institution_id]).order('id ASC')
        render json: { message: "Enrollments of institution #{params[:institution_id]} loaded.", data: enrollments }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Institution Id does not exist.' }, status: :not_found
      end

      # List specific enrollment by enrollment ID
      def show
        enrollment = Enrollment.find(params[:id])
        render json: { message: "Enrollment #{params[:id]} loaded.", data: enrollment }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Enrollment Id does not exist.' }, status: :not_found 
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
        enrollment = Enrollment.find(params[:id])
        enrollment.update_attributes(update_params)
        render json: { message: "Enrollment #{params[:id]} updated.", data: enrollment }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Enrollment Id does not exist.' }, status: :not_found
      end

      # Delete an enrollment
      def destroy
        enrollment = Enrollment.find(params[:id])
        enrollment.destroy
        render json: { message: "Enrollment #{params[:id]} deleted.", data: enrollment }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Enrollment Id does not exist.' }, status: :not_found
      end

      # Checks whether parameters have been accepted
      private

      def enrollment_params
        params.permit(:total_value, :ammount_bills, :due_day, :course, :institution_id, :student_id)
      end

      def update_params
        params.permit(:course, :institution_id)
      end
    end
  end
end
