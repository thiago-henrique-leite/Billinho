module Api
	module V1
    class InstitutionsController < ApplicationController  

      # Listar todas as Instituições
			def index
				institutions = Institution.order('id ASC');
				render json: {status: 'SUCCESSO', message:'Instituições de Ensino Carregadas', data:institutions},status: :ok
      end
      
      # Listar instituição passando ID
			def show
        institution = Institution.find(params[:id])
				render json: {status: 'SUCCESSO', message:'Instituição de Ensino Carregada', data:institution},status: :ok
      end
      
			# Criar uma nova instituição
			def create
				institution = Institution.new(institution_params)
				if institution.save
					render json: {status: 'SUCCESSO', message:'Instituição Cadastrada', data:institution},status: :ok
				else
					render json: {status: 'ERRO', message:'Instituição Não Cadastrada', data:institution.errors},status: :unprocessable_entity
				end
      end
      
			# Verifica se os parâmetros foram aceitos
			private
			def institution_params
				params.permit(:nome, :cnpj, :tipo)
      end
		end
	end
end


