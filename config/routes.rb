Rails.application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: {format: :json} do
    resources :users, except: [:new] do
      resources :photos, only: [:index]
    end
    resources :responses, only: [:create, :update]
  end

end
