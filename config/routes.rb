Rails.application.routes.draw do
  root to: "static_pages#root"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  get 'about' => 'about#index'

  namespace :api, defaults: {format: :json} do
    resources :users, except: [:new, :destroy] do
      resources :photos, only: [:index, :show]
      resources :messages, only: [:index]
    end

    resources :desired_genders, only: [:create, :destroy, :show]
    resources :likes, only: [:create, :destroy, :show]
    resources :responses, only: [:create, :update]
    resources :messages, only: [:create, :show]
    resources :visits, only: [:show]
  end # End API Namespace

end
