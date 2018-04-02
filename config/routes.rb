Rails.application.routes.draw do

  resources :employees
  resources :human_resources
  devise_for :users

  devise_scope :user do
  authenticated :user do
    root 'employees#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
  end



end
