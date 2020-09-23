module Api
  module V1
    class BillsController < ApplicationController
      # Lista todas as faturas no geral ou todas as faturas de uma determinada matrícula
			# GET api/v1/bills ou GET api/v1/enrollments/:enrollment_id/bills
      def index
        if params[:enrollment_id]
          bills = Bill.joins(:enrollment).where("enrollment_id = ?", params[:enrollment_id]).order('id ASC');
          render json: {status: 'SUCCESSO', message:'Faturas da determinada matrícula carregada.', data:bills},status: :ok
        else 
          bills = Bill.order('id ASC')
          render json: {status: 'SUCCESSO', message:'Todas as faturas carregadas.', data:bills},status: :ok
        end
      end
      
      # Lista fatura específica pelo ID da fatura
			# GET api/v1/bills/:id
      def show
        bill = Bill.find(params[:id]);
        render json: {status: 'SUCCESSO', message:'Fatura Carregada.', data:bill},status: :ok
      end

      # Atualiza os dados de uma instituição
			# PUT api/v1/bills/:id
			def update
				bill = Bill.find(params[:id])
				if bill.update_attributes(bill_params)
					render json: {status: 'SUCCESSO', message:'Fatura Atualizada.', data:bill},status: :ok
				else
					render json: {status: 'ERRO', message:'Fatura não atualizada.', data:bill.errors},status: :unprocessable_entity
				end
			end

      # Verifica se os parâmetros foram aceitos
      private
      def bill_params
        params.permit(:status)
      end
    end
  end
end 