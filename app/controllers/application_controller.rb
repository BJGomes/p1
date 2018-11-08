class ApplicationController < ActionController::Base

	# this controller could be used to include any properties 
	# inherited by the other controllers

	include Pagy::Backend

	def after_sign_in_path_for(*)
		new_ypentry_path
	end

end
