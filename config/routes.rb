Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'welcome#index'
  get 'home', to: 'pages#index' 
  resources :projects do
    resources :epics
    resources :project_users
  end
  resources :issues
end
