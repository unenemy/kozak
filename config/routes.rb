Rails.application.routes.draw do
  root to: 'home#index'
  resources :designs, only: :show
end
