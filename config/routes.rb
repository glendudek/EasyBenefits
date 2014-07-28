Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users

  resources :users do
    member do
      match 'benefits', via: [:get, :post]
    end
  end
end
