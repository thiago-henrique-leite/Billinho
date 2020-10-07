Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :institutions, :students, :enrollments, :bills

      get 'institutions/:institution_id/enrollments', to: 'enrollments#get_by_institutions'
      get 'students/:student_id/enrollments', to: 'enrollments#get_by_students'

      get 'students/:student_id/bills', to: 'bills#get_by_students'
      get 'enrollments/:enrollment_id/bills', to: 'bills#get_by_enrollments'
      get 'institutions/:institution_id/bills', to: 'bills#get_by_institutions'

      get 'institutions-all', to: 'institutions#get_all'
      get 'institutions-disabled', to: 'institutions#get_disabled'

      get 'students-all', to: 'students#get_all'
      get 'students-disabled', to: 'students#get_disabled'

      get 'enrollments-all', to: 'enrollments#get_all'
      get 'enrollments-disabled', to: 'enrollments#get_disabled'

      get 'bills-all', to: 'bills#get_all'
      get 'bills-disabled', to: 'bills#get_disabled'
    end
  end
end
