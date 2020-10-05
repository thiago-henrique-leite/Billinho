module Api
  module V1
    class InstitutionsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      # List institutions in general
      def index
        institutions = Institution.order('id ASC')
        render json: { message: 'Educational Institutions loaded.', data: institutions }, status: :ok
      end

      # List specific institution by institution ID
      def show
        institution = Institution.find(params[:id])
        render json: { message: "Educational Institution #{params[:id]} loaded.", data: institution }, status: :ok
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
        render json: { message: "Institution #{params[:id]} updated.", data: institution }, status: :ok
      end

      # Delete an institution
      def destroy
        institution = Institution.find(params[:id])
        institution.destroy
        render json: { message: "Institution #{params[:id]} deleted.", data: institution }, status: :ok
      end

      # Checks whether parameters have been accepted
      private

      def not_found
        render json: { message: 'Error: Not Found. Institution Id does not exist.' }, status: :not_found
      end

      def not_unique
        render json: { message: 'Error: Not Unique. Institution name or CNPJ already exists.' }, status: :conflict
      end

      def institution_params
        params.permit(:name, :cnpj, :kind, :cep)
      end
    end
  end
end
