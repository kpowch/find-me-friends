Rails.application.routes.draw do
  resources :friendships
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  root 'welcome#index'
  resources :welcome, only: [:index, :show]


  #routes as specified in Action Cable setup
  resources :chatrooms, param: :id
  resources :messages

  #old style routing, should update if we can figure out how
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, except: [:index, :destroy]
  resources :profiles, only: [:index]

  namespace :admin do
    root to: 'dashboard#show'
    resources :chatrooms, except: [:update]
    resources :users, only: [:new, :destroy, :update, :index]
    resources :friendships, except: [:update]
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
