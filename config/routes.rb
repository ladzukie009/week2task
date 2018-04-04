Rails.application.routes.draw do

  resources :employees
  resources :human_resources do
    collection do
      get 'requests'
    end
    member do
      put '/requests/update_status', to: 'human_resources#update_request_status'
    end
  end

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
