Rails.application.routes.draw do
  root to: "static_pages#root"

  get 'scratchpad' => 'scratch_pad#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get 'get_info' => 'users#get_info'
  get 'about' => 'about#index'

  namespace :api, defaults: {format: :json} do
    resources :users, except: [:new, :destroy] do
      resources :photos, only: [:index, :show, :create]
      resources :messages, only: [:index]
      resources :details, only: [:update]
    end

    resources :desired_genders, only: [:show, :update]
    resources :likes, only: [:create, :destroy, :show]
    resources :responses, only: [:create, :update]
    resources :messages, only: [:create, :show]
    resources :visits, only: [:show]
  end # End API Namespace

end
