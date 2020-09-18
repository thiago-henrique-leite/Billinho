module Api
	module V1
    class EnrollmentsController < ApplicationController  

      # Listar todas as Matrículas
			def index
				enrollments = Enrollment.order('id ASC');
				render json: {status: 'SUCCESSO', message:'Matrículas Carregadas.', data:enrollments},status: :ok
      end

      # Listar matrícula passando ID
			def show
        enrollment = Enrollment.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Matrícula Carregada.', data:enrollment},status: :ok
      end
      
			# Criar uma nova matrícula
			def create
				enrollment = Enrollment.new(enrollment_params)
				if enrollment.save
					render json: {status: 'SUCCESSO', message:'Matrícula Cadastrada.', data:enrollment},status: :ok
				else
					render json: {status: 'ERRO', message:'Matrícula Não Cadastrada.', data:enrollment.errors},status: :unprocessable_entity
				end
      end
      
			# Verifica se os parâmetros foram aceitos
			private
			def enrollment_params
				params.permit(:valor_total, :quant_faturas, :dia_vencimento, :curso, :institution, :student)
      end
		end
	end
end