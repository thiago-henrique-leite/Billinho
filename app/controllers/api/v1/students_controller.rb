module Api
  module V1
    class StudentsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      # List students in general
      def index
        students = Student.order('id ASC')
        render json: { message: 'All students loaded.', data: students }, status: :ok
      end

      # List specific student by student ID
      def show
        student = Student.find(params[:id])
        render json: { message: "Student #{params[:id]} loaded.", data: student }, status: :ok
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
        render json: { message: "Student #{params[:id]} updated.", data: student }, status: :ok
      end

      # Delete an student
      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: { message: "Student #{params[:id]} deleted.", data: student }, status: :ok
      end

      # Checks whether parameters have been accepted
      private

      def not_found
        render json: { message: 'Error: Not Found. Student Id does not exist.' }, status: :not_found
      end

      def not_unique
        render json: { message: 'Error: Not Unique. Student name or CPF already exists.' }, status: :conflict
      end

      def student_params
        params.permit(:name, :cpf, :birth_date, :phone, :gender, :pay_method, :cep)
      end
    end
  end
end
