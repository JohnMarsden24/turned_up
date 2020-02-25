Rails.application.routes.draw do
  root to: "users#home"
  devise_for :users

  resources :users do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:create, :new]
  end

  resources :bookings, only: [:destroy, :edit, :update]
  resources :reviews, only: [:destroy,  :edit, :update]
end
