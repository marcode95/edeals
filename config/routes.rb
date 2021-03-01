Rails.application.routes.draw do
  resources :groups
  resources :transactions
  resources :users
  root "sessions#welcome"
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  delete 'sign_out' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
