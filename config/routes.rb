Rails.application.routes.draw do
  get 'report_tags/create'
  get 'report_tags/destroy'
  get 'dashboards/dashboard'
  get 'reports/new'
  get 'reports/create'
  get 'reports/show'
  get 'reports/edit'
  get 'reports/update'
  get 'reports/destroy'
  get 'officers/show'
  get 'officers/new'
  get 'officers/create'
  get 'cities/show'
  get 'cities/index'
  devise_for :users
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
