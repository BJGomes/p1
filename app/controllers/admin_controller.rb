class AdminController < ApplicationController
	before_action :authenticate_user!

	def index
		@ola = "hello from AdminController"
	end

end
