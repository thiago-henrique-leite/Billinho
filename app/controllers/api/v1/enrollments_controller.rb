module Api
	module V1
    class EnrollmentsController < ApplicationController  

			# Lista todas as matrículas no geral ou todas as matrículas em uma instituição específica
			# GET api/v1/enrollments ou GET api/v1/institutions/:institution_id/enrollments
			def index
				if params[:institution_id]
					enrollments = Enrollment.joins(:institution).where("institution_id = ?", params[:institution_id]).order('id ASC')
					render json: {status: 'SUCCESSO', message:'Matrículas na instituição carregadas.', data:enrollments},status: :ok
				else
					enrollments = Enrollment.order('id ASC');
					render json: {status: 'SUCCESSO', message:'Todas as matrículas Carregadas.', data:enrollments},status: :ok
				end
      end

			# Lista uma matrícula específica pelo ID
			# GET api/v1/enrollments/:id
			def show
        enrollment = Enrollment.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Matrícula Carregada.', data:enrollment},status: :ok
      end
      
			# Cria uma nova matrícula
			# POST api/v1/enrollments
			def create
				enrollment = Enrollment.new(enrollment_params)
				if enrollment.save
					render json: {status: 'SUCCESSO', message:'Matrícula Cadastrada.', data:enrollment},status: :ok
				else
					render json: {status: 'ERRO', message:'Matrícula Não Cadastrada.', data:enrollment.errors},status: :unprocessable_entity
				end
			end
			
			# Atualiza os dados de uma matrícula
			# PUT api/v1/enrollments/:id
			def update
				enrollment = Enrollment.find(params[:id])

				if enrollment.update_attributes(update_params)
					render json: {status: 'SUCCESSO', message:'Matrícula Atualizada.', data:enrollment},status: :ok
				else
					render json: {status: 'ERRO', message:'Matrícula não atualizada.', data:enrollment.errors},status: :unprocessable_entity
				end
			end
      
			# Verifica se os parâmetros foram aceitos
			private
			def enrollment_params
				params.permit(:valor_total, :quant_faturas, :dia_vencimento, :curso, :institution_id, :student_id)
			end

			def update_params
				params.permit(:curso, :institution_id, :student_id)
			end
		end
	end
end