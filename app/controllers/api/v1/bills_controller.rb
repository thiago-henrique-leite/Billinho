module Api
  module V1
    class BillsController < ApplicationController
      # Lista as faturas no geral ou as faturas de uma matrícula ou as faturas de um estudante
      def index
        if params[:enrollment_id]
          bills = Bill.joins(:enrollment).where('enrollment_id = ?', params[:enrollment_id]).order('id ASC')
          render json: { status: 'SUCESSO', message: "Faturas da matrícula #{params[:enrollment_id]} carregadas.", data: bills }, status: :ok
        elsif params[:student_id]
          bills = Bill.joins(:student).where('student_id = ?', params[:student_id]).order('id ASC')
          render json: { status: 'SUCESSO', message: "Faturas do estudante #{params[:student_id]} carregadas.", data: bills }, status: :ok
        else
          bills = Bill.order('id ASC')
          render json: { status: 'SUCESSO', message: 'Todas as faturas carregadas.', data: bills }, status: :ok
        end
      end

      # Lista fatura específica pelo ID da fatura
      def show
        bill = Bill.find(params[:id])
        render json: { status: 'SUCESSO', message: "Fatura #{params[:id]} Carregada.", data: bill }, status: :ok
      end

      # Atualiza o status de uma fatura
      def update
        bill = Bill.find(params[:id])
        if bill.update_attributes(bill_params)
          render json: { status: 'SUCESSO', message: "Fatura #{params[:id]} Atualizada.", data: bill }, status: :ok
        else
          render json: { status: 'ERRO', message: "Fatura #{params[:id]} não atualizada.", data: bill.errors }, status: :unprocessable_entity
        end
      end

      # Deleta uma fatura
      def destroy
        bill = Bill.find(params[:id])
        bill.destroy
        render json: { status: 'SUCESSO', message: "Fatura #{params[:id]} Deletada.", data: bill }, status: :ok
      end

      # Verifica se os parâmetros foram aceitos
      private

      def bill_params
        params.permit(:status)
      end
    end
  end
end
