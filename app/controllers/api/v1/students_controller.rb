module Api
  module V1
    class StudentsController < ApplicationController
      # Lista todos os estudantes
      def index
        students = Student.order('id ASC')
        render json: { status: 'SUCCESSO', message: 'Lista de Estudantes Carregada.', data: students }, status: :ok
      end

      # Lista estudante específico pelo seu ID
      def show
        student = Student.find(params[:id])
        render json: { status: 'SUCCESSO', message: "Estudante #{params[:id]} carregado.", data: student }, status: :ok
      end

      # Cria um novo estudante
      def create
        student = Student.new(student_params)
        if student.save
          render json: { status: 'SUCCESSO', message: 'Estudante Cadastrado.', data: student }, status: :ok
        else
          render json: { status: 'ERRO', message: 'Estudante Não Cadastrado.', data: student.errors }, status: :unprocessable_entity
        end
      end

      # Atualiza os dados de um estudante
      def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
          render json: { status: 'SUCCESSO', message: "Estudante #{params[:id]} Atualizado.", data: student }, status: :ok
        else
          render json: { status: 'ERRO', message: "Estudante #{params[:id]} não atualizado.", data: student.errors }, status: :unprocessable_entity
        end
      end

      # Deleta um estudante
      def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: { status: 'SUCCESSO', message: "Estudante #{params[:id]} deletado", data: student }, status: :ok
      end

      # Verifica se os parâmetros foram aceitos
      private

      def student_params
        params.permit(:nome, :cpf, :data_nasc, :telefone, :genero, :meio_pagamento)
      end
    end
  end
end
