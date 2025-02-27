Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  mount SolidQueueDashboard::Engine, at: "/solid-queue"

  root "home#show"
  get "home/show"

  resources :characters do
    member do
      post :choose
    end
  end

  resource :equipment
  resource :action
end
