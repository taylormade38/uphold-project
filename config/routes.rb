Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cities, only: [:show, :index]
  resources :officers, only: [:show, :new, :create]
  resources :reports, except: [:index] do
    resources :report_tags, only: [:create, :destroy]
  end

  get "/dashboard", to: "dashboards#dashboard"

  resources :users, only: [:show]

end
