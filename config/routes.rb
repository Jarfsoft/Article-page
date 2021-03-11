Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'register', to: 'users#new'
  resources :users, only: %i[index show create]
  resources :projects
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: %i[destroy update]
  resources :projectcategoryrelationships, only: %i[new create destroy]
  resources :votes, only: %i[new create destroy]
end
