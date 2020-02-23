Rails.application.routes.draw do
  namespace :api do
  post '/users' => 'users#create'

  get '/events' => 'events#index'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#destroy'
  end
end
