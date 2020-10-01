Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :institutions, :students, :enrollments, :bills

      get 'institutions/:institution_id/enrollments', to: 'enrollments#index_by_institutions'
      get 'students/:student_id/enrollments', to: 'enrollments#index_by_students'

      get 'students/:student_id/bills', to: 'bills#index_by_students'
      get 'enrollments/:enrollment_id/bills', to: 'bills#index_by_enrollments'
    end
  end
end
