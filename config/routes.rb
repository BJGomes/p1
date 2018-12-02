Rails.application.routes.draw do
  	
  	devise_for :users
	resources :ypentries, except: :show
	resources :searches, only: [:new, :create]

  	# set the search page as the root page of the application
  	root to: "searches#new"
  
end