Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :users, only: [:show]
  root 'welcome#index'
  get 'home', to: 'pages#index' 
  resources :projects do
    resources :project_users do
      collection do
        post :invite
      end
    end
    resources :epics
    resources :issues
  end
end