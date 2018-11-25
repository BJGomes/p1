class SearchesController < ApplicationController
	respond_to :html, :json

	def new
		puts "Class: SearchesController, method: new"
		@name, @place = params[:name], params[:place]
		if (!@name.blank? and !@place.blank?)
			@pagy, @ypentries = pagy(Ypentry.where("name LIKE ? AND parish LIKE ?", '%'+@name+'%', '%'+@place+'%'), items: 3)
		elsif (!@name.blank?)
			@pagy, @ypentries = pagy(Ypentry.where("name LIKE ?", '%'+@name+'%'), items: 3)
		elsif (!@place.blank?)
			@pagy, @ypentries = pagy(Ypentry.where("parish LIKE ?", '%'+@place+'%'), items: 3)
		end
		if (!@ypentries.nil?)
			@hash = Gmaps4rails.build_markers(@ypentries) do |search, marker|
  				marker.lat search.latitude
  				marker.lng search.longitude
  				#para adicionar desciçao marker.infowindow search.description
  			end
		end
		@search = Search.new
	end

	def create
		puts "Class: SearchesController, method: create"
		@search = Search.new(search_params)
		if @search.save
			redirect_to new_search_path(search_params)
		else
			flash[:alert] = "Some errors were found!"
  			render "new"
		end
	end

	private
  	def search_params
    	params.fetch(:search).permit(:name, :place)
  	end

end
