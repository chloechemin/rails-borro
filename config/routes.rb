Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/pages/my_bookings', to: 'pages#my_bookings', as: :my_bookings

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :bookings
  end
  resources :bookings, only: [:index] do
    member do
      patch :accept
      patch :decline
    end
  end
end
