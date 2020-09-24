Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :institutions, :students, :enrollments, :bills

      resources :institutions do
        resources :enrollments
      end

      resources :students do
        resources :enrollments
      end
        
      resources :enrollments do
        resources :bills
      end

      resources :students do
        resources :bills
      end
    end
  end
end