Rails.application.routes.draw do
  
  resources :events do
    resources :bookings, only: [:create]
  end
  resources :venues
  devise_for :users

  get 'bookings/index'
  root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
