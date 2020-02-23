Rails.application.routes.draw do
  namespace :api do
  post '/users' => 'users#create'

  get '/events' => 'events#index'
  end
end
