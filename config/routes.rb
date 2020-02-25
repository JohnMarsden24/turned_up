Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :users do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:destroy, :edit, :update]
  resources :reviews, only: [:destroy,  :edit, :update]
end
