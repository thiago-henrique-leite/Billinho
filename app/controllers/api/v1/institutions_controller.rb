module Api
  module V1
    class InstitutionsController < ApplicationController
      include ExceptionTreatable

      # List enabled institutions
      def index
        institutions = Institution.where(enabled_inst: true)

        render json: { message: 'Educational Institutions loaded.', data: institutions }, status: :ok
      end

      # List specific institution by institution ID
      def show
        institution = Institution.find(params[:id])

        render json: { message: "Educational Institution #{params[:id]} loaded.", data: institution }, status: :ok
      end

      # List enabled and disabled institutions
      def get_all
        institutions = Institution.all

        render json: { message: 'All institutions loaded. Enabled and Disabled.', data: institutions }, status: :ok
      end

      # List disabled institutions
      def get_disabled
        institutions = Institution.where(enabled_inst: false)

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
        institution = Institution.find(params[:id])
        institution.update_attributes(institution_params)

        if institution_params.empty?
          render json: { message: "Institution #{params[:id]} selected. Enter the parameters to be updated.", data: institution }, status: :ok
        else
          render json: { message: "Institution #{params[:id]} updated.", data: institution }, status: :ok
        end
      end

      # Delete an institution
      def destroy
        ActiveRecord::Base.transaction do
          institution = Institution.find(params[:id])
          institution.update(enabled_inst: false)
          disable_bills(institution)
          disable_enrollments(institution)
          
          render json: { message: "Institution #{params[:id]} deleted.", data: institution }, status: :ok
        end
      end

      # Checks whether parameters have been accepted
      private

      def institution_params
        params.permit(:name, :cnpj, :kind, :cep)
      end

      def disable_bills(institution)
        Bill.where(institution_id: institution.id).update_all(enabled_bill: false)
      end

      def disable_enrollments(institution)
        Enrollment.where(institution_id: institution.id).update_all(enabled_enr: false)
      end
    end
  end
end
