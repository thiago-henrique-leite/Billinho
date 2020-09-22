module Api
  module V1
    class BillsController < ApplicationController
      # Lista todas as faturas
      def index
        bills = Bill.order('id ASC');
        render json: {status: 'SUCCESSO', message:'Lista de faturas carregada.', data:bills},status: :ok
      end
      
      # Lista fatura específica pelo ID da matrícula
      def show
        bill = Bill.find(params[:id])
        render json: {status: 'SUCCESSO', message:'Fatura carregada.', data:bill},status: :ok
      end

      # Verifica se os parâmetros foram aceitos
      private
      def institution_params
        params.permit(:enrollment_id, :student_id, :id)
      end
    end
  end
end 