class SearchController < ApplicationController

	def index
		user = User.take
		@ola = user.email
	end

end
