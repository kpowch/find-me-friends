Rails.application.routes.draw do
  # welcome page
  root 'welcome#index'

  resources :welcome, only: [:index, :show]

  resources :friendships

  resources :chatrooms, param: :id, except: [:new, :edit, :update]

  resources :messages, only: [:create]

  resources :tos, only: [:index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, except: [:index, :destroy]

  resources :profiles, only: [:index]

  resources :notifications, only: [:create, :destroy]

  # TODO need to delete some more of these routes?
  namespace :admin do
    root to: 'dashboard#show'
    resources :chatrooms, only: [:index]
    resources :users, only: [:show, :index]
    resources :friendships, only: [:show, :index]
  end

  # serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
