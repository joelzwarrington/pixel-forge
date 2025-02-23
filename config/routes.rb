Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "characters#index"

  resources :characters, shallow: true do
    resource :equipment
  end
end
