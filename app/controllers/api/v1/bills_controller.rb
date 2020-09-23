module Api
  module V1
    class BillsController < ApplicationController
      # Lista todas as faturas
			# GET api/v1/bills
      def index
        bills = Bill.order('id ASC');
        render json: {status: 'SUCCESSO', message:'Lista de faturas carregada.', data:bills},status: :ok
      end
      
      # Lista fatura específica pelo ID da fatura
			# GET api/v1/bills/:id
      def show
        bill = Bill.find(params[:id])
        render json: {status: 'SUCCESSO', message:'Fatura carregada.', data:bill},status: :ok
      end

      # Verifica se os parâmetros foram aceitos
      private
      def bill_params
        params.require(:id, :enrollment_id)
        params.permit(:status, :valor_total, :data_vencimento, :enrollment_id)
      end
    end
  end
end 