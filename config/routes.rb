Rails.application.routes.draw do
  resources :equipment_items
  resources :inventory_items
  resources :items
  get "up" => "rails/health#show", as: :rails_health_check

  root "characters#index"
  resources :characters
end
