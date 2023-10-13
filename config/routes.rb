Rails.application.routes.draw do
  get 'up' => 'rails/health#show'
  get '/api/caddy/check_domain', to: 'api/caddy#check_domain'

  resources :sites do
    resources :posts
    resources :pages

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
