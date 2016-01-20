Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "cars#index"

  get "/clients/find_by_document", to: "clients#find_by_document"
  get "/cars/find_by_plate/:plate", to: "cars#find_by_plate"
  get "/cities/:id", to: "locations#index"

  resources :cars do
    get :find_by_plate, on: :collection
  end

  resources :finances

end
