Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  mount SolidQueueDashboard::Engine, at: "/solid-queue"

  root "characters#index"

  resources :characters, shallow: true do
    resource :equipment
    resource :action
  end
end
