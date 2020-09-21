module Api
	module V1
    class EnrollmentsController < ApplicationController  

      # Lista todas as matrículas
			def index
				enrollments = Enrollment.order('id ASC');
				render json: {status: 'SUCCESSO', message:'Matrículas Carregadas.', data:enrollments},status: :ok
      end

      # Lista uma matrícula específica pelo ID
			def show
        enrollment = Enrollment.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Matrícula Carregada.', data:enrollment},status: :ok
      end
      
			# Cria uma nova matrícula
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
				params.permit(:valor_total, :quant_faturas, :dia_vencimento, :curso, :institution_id, :student_id)
      end
		end
	end
end