Rails.application.routes.draw do

  get '/entidades',   to: 'static_pages#entidades'
  get '/candidatos',  to: 'static_pages#candidatos'
  get '/reges',       to: 'static_pages#reges'
  get '/show',        to: 'user_entities#show' 
  get '/new',         to: 'user_entities#new'
  get '/new',         to: 'user_entities#create'
  get '/newsession',  to: 'sessions#newsession'
  get '/edit',        to: 'user_entities#edit' 
  get '/entidade',    to: 'user_entities#entidade'
  get '/signup',      to: 'users#new'
  

  delete '/logout',   to: 'sessions#destroy'
  delete '/log_out',  to: 'sessions#destroy_user'

  post'/signup',      to: 'users#create'
  post '/newsession', to: 'sessions#create'
  post'/new',         to: 'user_entities#create'

  root 'static_pages#home'

  resources :user_entities
  resources :users
end
