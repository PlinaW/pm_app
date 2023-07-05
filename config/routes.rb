Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'home', to: 'pages#index' 
  resources :projects
end
