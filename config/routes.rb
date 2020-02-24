Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :bookings, except: [:index, :show, :destroy, :edit, :update]
    resources :reviews, except: [:index, :show, :destroy]
  end

  resources :bookings, only: [:destroy, :edit, :update]
  resources :reviews, only: [:destroy,  :edit, :update]

end
