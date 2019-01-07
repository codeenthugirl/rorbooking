Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#login'
  resources :users
  resources :bookings
  post 'users/login' => 'users#createlogin', as:'login'
  get 'users/new' => 'users#new', as: 'register_user'
  get 'logout' => 'bookings#logout', as: 'logout'
end
