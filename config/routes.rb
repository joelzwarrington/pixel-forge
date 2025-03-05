Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  mount SolidQueueDashboard::Engine, at: "/solid-queue"

  devise_for :users, path: "", path_names: { sign_up: "register", sign_in: "login", sign_out: "logout" }
  resources :users, only: [ :index, :show ]

  resources :characters do
    member do
      post :choose
    end
  end

  get "items", to: "items#index"

  root "home#show"

  get "map", to: "map#show"
  resources :locations, only: :show do
    resources :nodes, only: :show do
      resources :recipes, only: :show
    end
  end

  resources :messages, only: :create

  resources :guilds
  resources :guild_characters

  resource :equipment
  resources :actions
end
