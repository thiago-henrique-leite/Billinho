module Api
  module V1
    class BillsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      # List enabled bills
      def index
        bills = Bill.where('enabled_bill = ?', true).order('id ASC')
        render json: { message: 'All bills loaded.', data: bills }, status: :ok
      end

      # List bills of a enrollment
      def get_by_enrollments
        params[:enrollment_id]
        bills = Bill.joins(:enrollment).where('enrollment_id = ?', params[:enrollment_id]).where('enabled_bill = ?', true).order('id ASC')
        render json: { message: "Bills of enrollment #{params[:enrollment_id]} loaded.", data: bills }, status: :ok
      end

      # List bills of a institution
      def get_by_institutions
        params[:institution_id]
        bills = Bill.joins(:institution).where('institution_id = ?', params[:institution_id]).where('enabled_bill = ?', true).order('id ASC')
        render json: { message: "Bills of institution #{params[:institution_id]} loaded.", data: bills }, status: :ok
      end

      # List bills of a student
      def get_by_students
        params[:student_id]
        bills = Bill.joins(:student).where('student_id = ?', params[:student_id]).where('enabled_bill = ?', true).order('id ASC')
        render json: { message: "Bills of student #{params[:student_id]} loaded.", data: bills }, status: :ok
      end
      
      # List enabled and disabled bills
      def get_all
        bills = Bill.order('id ASC')
        render json: { message: 'All bills loaded. Enabled and Disabled.', data: bills }, status: :ok
      end

      # List disabled bills
      def get_disabled
        bills = Bill.where('enabled_bill = ?', false).order('id ASC')
        render json: { message: 'All disabled bills loaded.', data: bills }, status: :ok
      end

      # List specific bill by bill ID
      def show
        bill = Bill.where('enabled_bill = ?', true).find(params[:id])
        render json: { message: "Bill #{params[:id]} loaded.", data: bill }, status: :ok
      end

      # Updates the status of an bill
      def update
        id = params[:id]
        bill = Bill.where('enabled_bill = ?', true).find(id)
        bill.update_attributes(bill_params)

        if bill_params.empty?
          render json: { message: "Bill #{id} selected. Enter the parameters to be updated.", data: bill }, status: :ok
        else
          bill = Bill.find(id)
          render json: { message: "Bill #{id} updated.", data: bill }, status: :ok
        end
      end

      # Delete an bill
      def destroy
        ActiveRecord::Base.transaction do
          bill = Bill.where('enabled_bill = ?', true).find(params[:id])

          enrollment = Enrollment.where('id = ?', bill.enrollment_id)

          bill.update(enabled_bill: false)

          amount_bills = enrollment.first.amount_bills
          total_value = enrollment.first.total_value

          new_amount_bills = amount_bills - 1
          new_total_value = total_value - bill.bill_value

          enrollment.update(amount_bills: new_amount_bills)
          enrollment.update(total_value: new_total_value)

          render json: { message: "Bill #{params[:id]} deleted.", data: bill}, status: :ok
        end
      end

      # Checks whether parameters have been accepted
      private

      def bill_params
        params.permit(:status, :bill_value, :due_date)
      end

      def not_found
        render json: { message: 'Error: Not Found. Bill Id does not exist.' }, status: :not_found
      end
    end
  end
end
