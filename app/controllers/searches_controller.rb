class SearchesController < ApplicationController
	respond_to :html, :json

	def index
		search = Search.take
		@search = search.name
	end

	def new
		puts "aaaaaaaaaaaaaaaaaaaaaaalllllllllll"
		@search = Search.new
		@pagy, @searches = pagy(Search.all, items: 3)
	end

	def create
		puts "Class: SearchesController, method: create"
		@search = Search.new(params)
		if @search.save
			redirect_to new_search_path
		else
			flash[:alert] = "Some errors were found!"
  			render "new"
		end
	end

end
