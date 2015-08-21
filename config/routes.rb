Rails.application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api, defaults: {format: :json} do
    resources :users, except: [:new, :destroy] do
      resources :photos
      resources :messages, only: [:index]
    end
    resources :likes, only: [:create, :destroy, :show]
    resources :responses, only: [:create, :update]
    resources :messages, only: [:create, :show]
    resources :visits, only: [:create, :show]
  end

end
