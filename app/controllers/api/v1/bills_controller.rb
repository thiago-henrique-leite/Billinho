module Api
  module V1
    class BillsController < ApplicationController
      # List bills in general
      def index
        bills = Bill.order('id ASC')
        render json: { message: 'All bills loaded.', data: bills }, status: :ok
      end

      # List bills of a enrollment
      def index_by_enrollments
        params[:enrollment_id]
        bills = Bill.joins(:enrollment).where('enrollment_id = ?', params[:enrollment_id]).order('id ASC')
        render json: { message: "Bills of enrollment #{params[:enrollment_id]} loaded.", data: bills }, status: :ok
      end

      # List bills of a student
      def index_by_students
        params[:student_id]
        bills = Bill.joins(:student).where('student_id = ?', params[:student_id]).order('id ASC')
        render json: { message: "Bills of student #{params[:student_id]} loaded.", data: bills }, status: :ok
      end

      # List specific bill by bill ID
      def show
        bill = Bill.find(params[:id])
        render json: { message: "Bill #{params[:id]} loaded.", data: bill }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Bill Id does not exist.' }, status: :not_found
      end

      # Updates the status of an bill
      def update
        bill = Bill.find(params[:id])
        bill.update_attributes(bill_params)
        render json: { message: "Bill #{params[:id]} updated.", data: bill }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Bill Id does not exist.' }, status: :not_found
      end

      # Delete an bill
      def destroy
        bill = Bill.find(params[:id])
        bill.destroy
        render json: { message: "Bill #{params[:id]} deleted.", data: bill }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Error: Not Found. Bill Id does not exist.' }, status: :not_found
      end

      # Checks whether parameters have been accepted
      private

      def bill_params
        params.permit(:status, :bill_amount, :due_date)
      end
    end
  end
end
