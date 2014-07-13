Rails.application.routes.draw do
  root to: 'home#index'
  resources :designs, only: :show

  namespace :api do
    resources :users do
      collection do
        post :sign_in, :sign_up
      end
    end
  end
end
