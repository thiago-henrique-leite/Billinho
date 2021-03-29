module Api
  module V1
    class BillsController < ApplicationController
      include ExceptionTreatable

      # List enabled bills
      def index
        bills = Bill.where(enabled_bill: true)
        render json: { message: 'All bills loaded.', data: bills }, status: :ok
      end

      # List bills of a enrollment
      def get_by_enrollments
        enrollment_id = params[:enrollment_id]
        bills = Bill.joins(:enrollment).where(enrollment_id: enrollment_id, enabled_bill: true)

        render json: { message: "Bills of enrollment #{enrollment_id} loaded.", data: bills }, status: :ok
      end

      # List bills of a institution
      def get_by_institutions
        institution_id = params[:institution_id]
        bills = Bill.joins(:institution).where(institution_id: institution_id, enabled_bill: true)

        render json: { message: "Bills of institution #{institution_id} loaded.", data: bills }, status: :ok
      end

      # List bills of a student
      def get_by_students
        student_id = params[:student_id]
        bills = Bill.joins(:student).where(student_id: student_id, enabled_bill: true)

        render json: { message: "Bills of student #{params[:student_id]} loaded.", data: bills }, status: :ok
      end

      # List enabled and disabled bills
      def get_all
        bills = Bill.all
        render json: { message: 'All bills loaded. Enabled and Disabled.', data: bills }, status: :ok
      end

      # List disabled bills
      def get_disabled
        bills = Bill.where(enabled_bill: false)

        render json: { message: 'All disabled bills loaded.', data: bills }, status: :ok
      end

      # List specific bill by bill ID
      def show
        bill = Bill.where(enabled_bill: true).find(params[:id])

        render json: { message: "Bill #{params[:id]} loaded.", data: bill }, status: :ok
      end

      # Updates the status of an bill
      def update
        id = params[:id]
        bill = Bill.find(id)
        bill.update_attributes(bill_params)

        if bill_params.empty?
          render json: { message: "Bill #{id} selected. Enter the parameters to be updated.", data: bill }, status: :ok
        else
          render json: { message: "Bill #{id} updated.", data: bill }, status: :ok
        end
      end

      # Delete an bill
      def destroy
        ActiveRecord::Base.transaction do
          bill = Bill.find(params[:id])
          enrollment = Enrollment.find(bill.enrollment_id)
          
          bill.update(enabled_bill: false, status: :canceled)
          enrollment.update(
            amount_bills: enrollment.first.amount_bills - 1, 
            total_value: total_value - bill.bill_value
          )

          render json: { message: "Bill #{params[:id]} deleted.", data: bill }, status: :ok
        end
      end

      private
      
      # Checks whether parameters have been accepted
      def bill_params
        params.permit(:status, :bill_value, :due_date)
      end
    end
  end
end
