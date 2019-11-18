Rails.application.routes.draw do
  get 'sessions/news'
  get '/entidades',   to: 'static_pages#entidades'
  get '/candidatos',  to: 'static_pages#candidatos'
  get '/reges',       to: 'static_pages#reges'
  get '/show',        to: 'user_ent#show' 
  get '/new',         to: 'user_ent#new' 
  get '/new',         to: 'user_ent#new'
  get '/new',         to: 'user_ent#create'
  post'/new',         to: 'user_ent#create'
  get '/newsession',  to: 'sessions#newsession'
  post '/newsession', to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root 'static_pages#home'

  resources :user_ent
end
