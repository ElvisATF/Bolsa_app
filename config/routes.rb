Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get '/entidades',   to: 'static_pages#entidades'
  get '/candidatos',  to: 'static_pages#candidatos'
  get '/reges',       to: 'static_pages#reges'
  get '/show',        to: 'user_entities#show' 
  get '/new',         to: 'user_entities#new'
  get '/new',         to: 'user_entities#create'
  get '/newsession',  to: 'sessions#newsession'
  get '/edit',        to: 'user_entities#edit' 
  get '/edit',        to: 'users#edit' 
  get '/entidade',    to: 'user_entities#entidade'
  get '/signup',      to: 'users#new'


  get '/index',       to: 'user_entities#index'
  get '/index_user',  to: 'users#index'

  delete '/logout',   to: 'sessions#destroy'

  post'/signup',      to: 'users#create'
  post '/newsession', to: 'sessions#create'
  post'/new',         to: 'user_entities#create'

  root 'static_pages#home'


  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :user_entities
  resources :users
end
