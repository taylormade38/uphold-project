Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cities, only: [:show, :index] do
    collection do
      get :sort
    end
  end
  resources :officers, only: [:show, :new, :create]
  resources :reports, except: [:index] do
    resources :report_tags, only: [:create, :destroy]
    resources :report_votes, only: [:create]
    resources :report_bookmarks, only: [:create]
  end

  resources :report_votes, only: [:destroy]

  get "/dashboard", to: "dashboards#dashboard"
  delete "/report_bookmarks/:report_id", to: "report_bookmarks#destroy", as: 'report_report_bookmark'
  get "/officers/search", to: "officers#search", as: "officers_search"

  resources :users, only: [:show]

end
