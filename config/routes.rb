Rails.application.routes.draw do
  get 'search/result'
  get 'search/no_result'
  devise_for :users
  root to: 'pages#landing'
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  get '/pages/home', to: 'pages#home'
  get '/pages/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  get '/pages/my_messages', to: 'pages#my_messages', as: :my_messages
  get '/pages/my_posts', to: 'pages#my_posts', as: :my_posts
  get '/pages/my_profile', to: 'pages#my_profile', as: :my_profile
  get '/pages/search', to: 'pages#search'
  get '/pages/post_confirmation', to: 'pages#post_confirmation', as: :post_confirmation

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :bookings do
      resources :reviews, only: [:new, :create]
    end
  end
  resources :help_requests do
    resources :helps, only: [:new, :create]
  end
  resources :bookings, only: :index do
    member do
      patch :accept
      patch :decline
      patch :request_review
    end
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  resources :notifications, only: :index
  resources :notifications do
    post :read_all, on: :collection
  end
end
