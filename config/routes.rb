Rails.application.routes.draw do
  	devise_for :users
	resources :ypentries
	resources :searches

  	# set the search page as the root page of the application
  	root to: "searches#new"
  
end