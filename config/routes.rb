Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :institutions
    end
  end

  namespace 'api' do
    namespace 'v1' do
      resources :students
    end
  end
end