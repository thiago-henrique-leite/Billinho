module ExceptionTreatable
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do 
      rescue_from ActiveRecord::RecordInvalid do
        render json: { message: 'Errors: Record Invalid' }, status: :unprocessable_entity
      end

      rescue_from ActiveRecord::RecordNotFound do
        render json: { message: 'Errors: Record Not Found' }, status: :not_found
      end

      rescue_from ActiveRecord::RecordNotUnique do
        render json: { message: 'Errors: Record Not Unique' }, status: :conflict
      end
    end
  end
end