Rails.application.routes.draw do
  devise_for :users

  # set the search page as the root page of the application
  root to: 'search#index'

  get '/admin', to: 'admin#index'
  
end
