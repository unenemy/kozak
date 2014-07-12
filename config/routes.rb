Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :designs, only: :show
end
