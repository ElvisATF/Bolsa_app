Rails.application.routes.draw do

  #get 'sessions/news'
  get '/entidades',   to: 'static_pages#entidades'
  get '/candidatos',  to: 'static_pages#candidatos'
  get '/reges',       to: 'static_pages#reges'
  get '/show',        to: 'user_entities#show' 
  get '/new',         to: 'user_entities#new'
  get '/new',         to: 'user_entities#create'
  post'/new',         to: 'user_entities#create'
  get '/newsession',  to: 'sessions#newsession'
  post '/newsession', to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get '/edit',        to: 'user_entities#edit' 
  get '/entidade',    to: 'user_entities#entidade'
  get '/signup',      to: 'users#new'

  #get '/edit',        to: 'user_entity#update'
  post'/edit',        to: 'user_entities#update'
  root 'static_pages#home'

  resources :user_entities
end
