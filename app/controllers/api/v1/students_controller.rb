module Api
	module V1
		class StudentsController < ApplicationController
      			
			# Lista todos os estudantes
			# GET api/v1/students
			def index
				students = Student.order('id ASC');
				render json: {status: 'SUCCESSO', message:'Lista de estudantes carregada.', data:students},status: :ok
      end
      
			# Lista estudante específico pelo seu ID
			# GET api/v1/students/:id
			def show
        student = Student.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Dados do estudante carregados.', data:student},status: :ok
      end
      
			# Cria um novo estudante
			# POST api/v1/students
			def create
				student = Student.new(student_params)
				if student.save
					render json: {status: 'SUCCESSO', message:'Estudante Cadastrado.', data:student},status: :ok
				else
					render json: {status: 'ERRO', message:'Estudante Não Cadastrado.', data:student.errors},status: :unprocessable_entity
				end
			end
			
			# Atualiza os dados de um estudante
			# PUT api/v1/students/:id
			def update
				student = Student.find(params[:id])
				if student.update_attributes(student_params)
					render json: {status: 'SUCCESSO', message:'Estudante Atualizado.', data:student},status: :ok
				else
					render json: {status: 'ERRO', message:'Estudante não atualizado.', data:student.errors},status: :unprocessable_entity
				end
			end
      
			# Verifica se os parâmetros foram aceitos
			private
			def student_params
				params.permit(:nome, :cpf, :data_nasc, :telefone, :genero, :meio_pagamento)
      end
		end
	end
end