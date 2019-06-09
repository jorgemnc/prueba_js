Rails.application.routes.draw do
  resources :reason_for_non_attendances
  root to: 'attendances#index'
  resources :attendances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
