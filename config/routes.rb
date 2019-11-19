Rails.application.routes.draw do
  #get 'sessions/news'
  get '/entidades',   to: 'static_pages#entidades'
  get '/candidatos',  to: 'static_pages#candidatos'
  get '/reges',       to: 'static_pages#reges'
  get '/show',        to: 'user_entity#show' 
  get '/new',         to: 'user_entity#new'
  get '/new',         to: 'user_entity#create'
  post'/new',         to: 'user_entity#create'
  get '/newsession',  to: 'sessions#newsession'
  post '/newsession', to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get '/edit',        to: 'user_ent#edit' 
  root 'static_pages#home'

  resources :user_ent
end
