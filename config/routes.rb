Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create, :update]
  resources :transactions, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
  root "sessions#welcome"
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  get 'sign_out' => 'sessions#destroy'
  get 'external_index', to: 'transactions#external_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
