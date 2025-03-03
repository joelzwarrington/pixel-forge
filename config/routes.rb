Rails.application.routes.draw do
  resources :nodes
  get "items", to: "items#index"
  get "up" => "rails/health#show", as: :rails_health_check

  mount SolidQueueDashboard::Engine, at: "/solid-queue"

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout" }
  resources :users, only: [ :index, :show ]

  resources :characters do
    member do
      post :choose
    end
  end

  root "home#show"

  get "map", to: "map#show"

  resources :locations, only: [ :index, :show ] do
    resources :nodes, only: [ :index, :show ]
  end
  resources :guilds
  resources :guild_characters

  resource :equipment
  resources :actions
end
