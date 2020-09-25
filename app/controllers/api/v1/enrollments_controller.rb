module Api
	module V1
    class EnrollmentsController < ApplicationController  

			# Lista as matrículas no geral ou as matrículas de uma instituição ou as matrículas de um estudante
			def index
				if params[:student_id]
					enrollments = Enrollment.joins(:student).where("student_id = ?", params[:student_id]).order('id ASC')
					render json: {status: 'SUCCESSO', message:"Matrículas do Estudante #{params[:student_id]} Carregadas.", data:enrollments},status: :ok
				elsif params[:institution_id]
					enrollments = Enrollment.joins(:institution).where("institution_id = ?", params[:institution_id]).order('id ASC')
					render json: {status: 'SUCCESSO', message:"Matrículas da Instituição #{params[:institution_id]} Carregadas.", data:enrollments},status: :ok
				else
					enrollments = Enrollment.order('id ASC');
					render json: {status: 'SUCCESSO', message:"Todas as matrículas Carregadas.", data:enrollments},status: :ok
				end
      end

			# Lista uma matrícula específica pelo ID
			def show
        enrollment = Enrollment.find(params[:id])
				render json: {status: 'SUCCESSO', message:"Matrícula #{params[:id]} Carregada.", data:enrollment},status: :ok
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
			
			# Atualiza os dados de uma matrícula
			def update
				enrollment = Enrollment.find(params[:id])
				if enrollment.update_attributes(update_params)
					render json: {status: 'SUCCESSO', message:"Matrícula #{params[:id]} Atualizada.", data:enrollment},status: :ok
				else
					render json: {status: 'ERRO', message:"Matrícula #{params[:id]} não atualizada.", data:enrollment.errors},status: :unprocessable_entity
				end
			end
			
			# Deleta uma matrícula
			def destroy
				enrollment = Enrollment.find(params[:id])
				enrollment.destroy
				render json: {status: 'SUCCESSO', message:"Matrícula #{params[:id]} Deletada.", data:enrollment},status: :ok
			end
      
			# Verifica se os parâmetros foram aceitos
			private
			def enrollment_params
				params.permit(:valor_total, :quant_faturas, :dia_vencimento, :curso, :institution_id, :student_id)
			end

			def update_params
				params.permit(:curso, :institution_id)
			end
		end
	end
end