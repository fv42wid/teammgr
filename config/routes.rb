Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :employees
  resources :assignments, only: [:create, :destroy, :update]

  root 'employees#index'

end
