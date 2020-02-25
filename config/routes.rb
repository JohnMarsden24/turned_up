Rails.application.routes.draw do
  devise_for :users
  root "users#home"
  resources :users do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:destroy, :edit, :update]
  resources :reviews, only: [:destroy,  :edit, :update]
end
