module Api
	module V1
    class InstitutionsController < ApplicationController  

			# Lista todas as instituições
			# GET api/v1/institutions 
			def index
				institutions = Institution.order('id ASC');
				render json: {status: 'SUCCESSO', message:'Instituições de Ensino Carregadas.', data:institutions},status: :ok
      end
      
			# Lista uma instituição específica pelo seu ID
			# GET api/v1/institutions/:id
			def show
        institution = Institution.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Instituição de Ensino Carregada.', data:institution},status: :ok
      end
      
			# Cria uma nova instituição
			# POST api/v1/institutions
			def create
				institution = Institution.new(institution_params)
				if institution.save
					render json: {status: 'SUCCESSO', message:'Instituição Cadastrada.', data:institution},status: :ok
				else
					render json: {status: 'ERRO', message:'Instituição Não Cadastrada.', data:institution.errors},status: :unprocessable_entity
				end
			end

			# Atualiza os dados de uma instituição
			# PUT api/v1/institutions/:id
			def update
				institution = Institution.find(params[:id])
				if institution.update_attributes(institution_params)
					render json: {status: 'SUCCESSO', message:'Instituição Atualizada.', data:institution},status: :ok
				else
					render json: {status: 'ERRO', message:'Instituição não atualizada.', data:institution.errors},status: :unprocessable_entity
				end
			end

			# Deleta a instituição
			# DELETE api/v1/institutions/:id
			def destroy
				institution = Institution.find(params[:id])
				institution.destroy
				render json: {status: 'SUCCESSO', message:'Instituição deletada', data:institution},status: :ok
			end
      
			# Verifica se os parâmetros foram aceitos
			private
			def institution_params
				params.permit(:nome, :cnpj, :tipo)
      end
		end
	end
end


