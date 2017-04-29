Rails.application.routes.draw do
  # welcome page
  root 'welcome#index'

  resources :welcome, only: [:index]

  resources :friendships

  # routes as specified in Action Cable setup
  resources :chatrooms, param: :id
  resources :messages

  # TODO old style routing, should update if we can figure out how
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, except: [:index, :destroy]
  resources :profiles, only: [:index]

  namespace :admin do
    root to: 'dashboard#show'
    resources :chatrooms, except: [:update, :show]
    resources :users
    resources :friendships, except: [:update]
  end

  # serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
