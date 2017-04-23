Rails.application.routes.draw do
  resources :friendships
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  root 'welcome#index'
  resources :welcome, only: [:index, :show]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  #routes as specified in Action Cable setup
  resources :chatrooms, param: :id
  resources :messages

  #old style routing, should update if we can figure out how
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

  resources :profiles, only: [:index, :show, :create]

end
