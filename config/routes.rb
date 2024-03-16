Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'tops#index'
  # root "posts#index"
  get 'terms_of_service', to: 'terms_of_service#show'
  get 'privacy_policy', to: 'privacy_policy#show'

  resources :users, only: [:new, :create, :index, :show] do
    resource :relationships, only: [:create, :destroy]
  	  get "followings" => "relationships#followings", as: "followings"
  	  get "followers" => "relationships#followers", as: "followers"
    collection do
      get 'search'
    end
  end

  resource :user_session, only: [:new, :create, :destroy]

  resources :test_results, except: [:show] do
    collection do
      get 'my_results'
    end
  end

  resource :profile, only: %i[show edit update]
  
  resources :notifications, only: :index

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :test_results, only: %i[index edit update show destroy]
    resources :users, only: %i[index edit update show destroy]
  end
end
