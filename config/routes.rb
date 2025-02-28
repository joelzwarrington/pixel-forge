Rails.application.routes.draw do
  get "items", to: "items#index"
  get "up" => "rails/health#show", as: :rails_health_check

  mount SolidQueueDashboard::Engine, at: "/solid-queue"

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout" }
  resources :users, only: [ :index, :show ]

  root "home#show"
  get "home/show"

  resources :characters do
    member do
      post :choose
    end
  end

  resources :guilds
  resources :guild_characters

  resource :equipment
  resources :actions
end
