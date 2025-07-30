Rails.application.routes.draw do
  
  resources :events
  resources :venues
  devise_for :users
  root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
