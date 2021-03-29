module Api
  module V1
    class StudentsController < ApplicationController
      include ExceptionTreatable

      # List enabled students
      def index
        students = Student.where(enabled_std: true)

        render json: { message: 'All students loaded.', data: students }, status: :ok
      end

      # List specific student by student ID
      def show
        student = Student.find(params[:id])

        render json: { message: "Student #{params[:id]} loaded.", data: student }, status: :ok
      end

      # List enabled and disabled students
      def get_all
        students = Student.all

        render json: { message: 'All students loaded. Enabled and Disabled.', data: students }, status: :ok
      end

      # List disabled students
      def get_disabled
        students = Student.where(enabled_std: false)

        render json: { message: 'All disabled students loaded.', data: students }, status: :ok
      end

      # Create a new student
      def create
        student = Student.new(student_params)

        if student.save
          render json: { message: 'Student registered.', data: student }, status: :ok
        else
          render json: { message: 'Student not registered.', data: student.errors }, status: :unprocessable_entity
        end
      end

      # Updates a student
      def update
        student = Student.find(params[:id])
        student.update_attributes(student_params)

        if student_params.empty?
          render json: { message: "Student #{params[:id]} selected. Enter the parameters to be updated.", data: student }, status: :ok
        else
          render json: { message: "Student #{params[:id]} updated.", data: student }, status: :ok
        end
      end

      # Delete an student
      def destroy
        ActiveRecord::Base.transaction do
          student = Student.where(enabled_std: true).find(params[:id])
          student.update(enabled_std: false)
          disable_enrollments(student)
          disable_bills(student)

          render json: { message: "Student #{params[:id]} deleted.", data: student }, status: :ok
        end
      end

      # Checks whether parameters have been accepted
      private

      def student_params
        params.permit(:name, :cpf, :birth_date, :phone, :gender, :pay_method, :cep)
      end

      def disable_bill(student)
        Bill.where('student_id = ?', params[:id]).update_all(enabled_bill: false)
      end

      def disable_enrollments(student)
        Enrollment.where('student_id = ?', params[:id]).update_all(enabled_enr: false)
      end
    end
  end
end
