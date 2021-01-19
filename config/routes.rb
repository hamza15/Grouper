Rails.application.routes.draw do

  root 'sessions#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  #resources :memberships
  
  # MOST LIKELY SOLUTION
  # resources :users do 
  #   resources :groups
  # end
  # resources :groups do
  #   resources :memberships, only: [:new, :index]
  # end
  
  #TESTING WITH VID
  resources :users do 
    resources :groups, only: [:new, :create, :index]
  end

  resources :groups do 
    resources :memberships, only: [:new, :create, :index]
  end
end
