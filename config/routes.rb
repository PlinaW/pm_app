Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'welcome#index'
  get 'home', to: 'pages#index' 
  resources :projects do
    resources :project_users
    resources :epics
    resources :issues
  end
end
