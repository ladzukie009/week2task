Rails.application.routes.draw do

  root "human_resources#index"
  resources :employees
  resources :human_resources
  devise_for :users

end
