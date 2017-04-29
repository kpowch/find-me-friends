Rails.application.routes.draw do
  # welcome page
  root 'welcome#index'

  resources :welcome, only: [:index]

  # TODO need to delete any of these routes?
  resources :friendships

  # routes as specified in Action Cable setup
  # TODO potentially delete index, new
  resources :chatrooms, param: :id, except: [:edit, :update]

  resources :messages, only [:create]

  # TODO old style routing, should update if we can figure out how
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, except: [:index, :destroy]

  resources :profiles, only: [:index]

  # TODO need to delete some more of these routes? 
  namespace :admin do
    root to: 'dashboard#show'
    resources :chatrooms, except: [:show, :edit, :update]
    resources :users, except: [:show]
    resources :friendships, except: [:show]
  end

  # serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
