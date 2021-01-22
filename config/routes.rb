Rails.application.routes.draw do

  root 'sessions#home'

  get '/auth/:provider/callback' => 'sessions#google'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/groups' => 'groups#discover'
  
  resources :users do 
    resources :groups, only: [:new, :create, :index]
  end
  
  resources :groups do 
    resources :topics
  end
  resources :topics
end
