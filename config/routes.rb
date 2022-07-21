Rails.application.routes.draw do
  get 'search/result'
  get 'search/no_result'
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

  get '/pages/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  get '/pages/my_posts', to: 'pages#my_posts', as: :my_posts
  get '/pages/search', to: 'pages#search'


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
    end
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
end
