Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users

  resources :customers do
    collection do
      get :search
    end
  end

  resources :equipments do
    collection do
      get :search
    end
  end

  resources :orders

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
