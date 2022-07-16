Rails.application.routes.draw do
  get 'search/result'
  get 'search/no_result'
  devise_for :users
  root to: 'pages#home'

  get '/pages/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  get '/pages/search', to: 'pages#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :bookings
  end
end
