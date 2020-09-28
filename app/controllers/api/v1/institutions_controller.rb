module Api
  module V1
    class InstitutionsController < ApplicationController
      # Lista todas as instituições
      def index
        institutions = Institution.order('id ASC')
        render json: { status: 'SUCESSO', message: 'Instituições de Ensino Carregadas.', data: institutions }, status: :ok
      end

      # Lista uma instituição específica pelo seu ID
      def show
        institution = Institution.find(params[:id])
        render json: { status: 'SUCESSO', message: "Instituição de Ensino #{params[:id]} Carregada.", data: institution }, status: :ok
      end

      # Cria uma nova instituição
      def create
        institution = Institution.new(institution_params)
        if institution.save
          render json: { status: 'SUCESSO', message: "#{institution_params[:nome]} Cadastrada.", data: institution }, status: :ok
        else
          render json: { status: 'ERRO', message: 'Instituição Não Cadastrada.', data: institution.errors }, status: :unprocessable_entity
        end
      end

      # Atualiza os dados de uma instituição
      def update
        institution = Institution.find(params[:id])
        if institution.update_attributes(institution_params)
          render json: { status: 'SUCESSO', message: "Instituição #{params[:id]} Atualizada.", data: institution }, status: :ok
        else
          render json: { status: 'ERRO', message: "Instituição #{params[:id]} não atualizada.", data: institution.errors }, status: :unprocessable_entity
        end
      end

      # Deleta uma instituição
      def destroy
        institution = Institution.find(params[:id])
        institution.destroy
        render json: { status: 'SUCESSO', message: "Instituição #{params[:id]} deletada", data: institution }, status: :ok
      end

      # Verifica se os parâmetros foram aceitos
      private

      def institution_params
        params.permit(:nome, :cnpj, :tipo)
      end
    end
  end
end
