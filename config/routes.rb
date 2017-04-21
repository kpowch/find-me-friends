Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  root 'welcome#index'
  resources :welcome, only: [:index, :show]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

end
