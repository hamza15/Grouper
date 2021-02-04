Rails.application.routes.draw do

  root 'sessions#home'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/search' => 'groups#search'

  get '/groups' => 'groups#discover'
  
  resources :users do 
    resources :groups, only: [:new, :create, :index]
  end
  
  resources :groups do 
    resources :topics
  end
  resources :topics

  resources :meetings
  
  resources :groups do
    resources :meetings
  end
end
