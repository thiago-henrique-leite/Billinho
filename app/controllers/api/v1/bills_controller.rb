module Api
  module V1
    class BillsController < ApplicationController
      # Lista todos as faturas
      def index
          bills = Bill.order('id ASC');
          render json: {status: 'SUCCESSO', message:'Lista de faturas carregada.', data:bills},status: :ok
      end
      
      # Lista fatura específica pelo ID da matrícula
      def show
        bill = Bill.find(params[:id])
        render json: {status: 'SUCCESSO', message:'Fatura carregada.', data:bill},status: :ok
      end
    end
  end
end 