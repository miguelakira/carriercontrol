Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :cars
  root "cars#index"

  resources :cars
  resources :finances

  get "/clients/find_by_document", to: "clients#find_by_document"
  get "/cities/:id", to: "locations#index"

end
