Rails.application.routes.draw do
  get 'up' => 'rails/health#show'

  namespace :api do
    resources :sites, only: [] do
      resources :slugs, only: [:create]
    end

    resources :caddy, only: [] do
      collection do
        get :check_domain
      end
    end
  end

  resources :sites do
    resources :posts
    resources :pages
    resources :deployment_targets, only: %i[index edit update]
    resources :navigations, only: %i[index create] do
      resources :navigation_items
    end

    get 'image/create'
    resources :images, only: %i[show create] do
      collection do
        post :from_url
      end
    end
  end
  root 'sites#index'

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  get 'login/:token', to: 'sessions#show', as: :login_token
  delete 'logout', to: 'sessions#destroy', as: :logout

  mount GoodJob::Engine => 'good_job', constraints: SuperAdminConstraint.new
end
