Rails.application.routes.draw do
  devise_for :users

  root to: 'front_end/visitors#index'

  namespace :front_end do
    resources :users do
      member do
        match 'benefits', via: [:get, :post]
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          match 'current', via: :get
        end
        member do
          match 'benefits', via: [:get, :post]
          match 'companies', via: [:get, :post]
        end
      end
      resources :companies do
        member do
          match 'benefits', via: [:get, :post]
          match 'users', via: [:get, :post]
        end
      end
    end
  end
end
