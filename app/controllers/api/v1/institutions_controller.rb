module Api
  module V1
    class InstitutionsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      # List enabled institutions
      def index
        institutions = Institution.where('enabled_inst = ?', true).order('id ASC')
        render json: { message: 'Educational Institutions loaded.', data: institutions }, status: :ok
      end

      # List specific institution by institution ID
      def show
        institution = Institution.where('enabled_inst = ?', true).find(params[:id])
        render json: { message: "Educational Institution #{params[:id]} loaded.", data: institution }, status: :ok
      end

      # List enabled and disabled institutions
      def get_all
        institutions = Institution.order('id ASC')
        render json: { message: 'All institutions loaded. Enabled and Disabled.', data: institutions }, status: :ok
      end

      # List disabled institutions
      def get_disabled
        institutions = Institution.where('enabled_inst = ?', false).order('id ASC')
        render json: { message: 'All disabled institutions loaded.', data: institutions }, status: :ok
      end

      # Create a new institution
      def create
        institution = Institution.new(institution_params)
        if institution.save
          render json: { message: "#{institution_params[:name]} registered.", data: institution }, status: :ok
        else
          render json: { message: 'Educational institution not registered.', data: institution.errors }, status: :unprocessable_entity
        end
      end

      # Updates a institution
      def update
        institution = Institution.where('enabled_inst = ?', true).find(params[:id])
        institution.update_attributes(institution_params)

        if institution_params.empty?
          render json: { message: "Institution #{params[:id]} selected. Enter the parameters to be updated.", data: institution }, status: :ok
        else
          institution = Institution.find(params[:id])
          render json: { message: "Institution #{params[:id]} updated.", data: institution }, status: :ok
        end
      end

      # Delete an institution
      def destroy
        ActiveRecord::Base.transaction do
          institution = Institution.where('enabled_inst = ?', true).find(params[:id])

          bills = Bill.where('institution_id = ?', params[:id]).update_all(enabled_bill: false)
          enrollments = Enrollment.where('institution_id = ?', params[:id]).update_all(enabled_enr: false)

          institution.update(enabled_inst: false)
          render json: { message: "Institution #{params[:id]} deleted.", data: institution }, status: :ok
        end
      end

      # Checks whether parameters have been accepted
      private

      def institution_params
        params.permit(:name, :cnpj, :kind, :cep)
      end

      def not_found
        render json: { message: 'Error: Not Found. Institution Id does not exist.' }, status: :not_found
      end

      def not_unique
        render json: { message: 'Error: Not Unique. Name or CNPJ already exists.' }, status: :conflict
      end
    end
  end
end
