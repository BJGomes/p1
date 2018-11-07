class YpentriesController < ApplicationController
	  before_action :authenticate_user!
	  respond_to :html, :json

	  def index
		    puts "Class: YpentriesController, method: index"
		    @pagy, @ypentries = pagy(Ypentry.all, items: 3)
	  end

	  # GET method to get a product by id
	  # rendered in ypentries/show. Currently not implemented.
  	def show
  		  puts "Class: YpentriesController, method: show, params: id->" + params[:id]
    	  #@product = Product.find(params[:id])
  	end

  	def new
		    puts "Class: YpentriesController, method: new"
		    @ypentry = Ypentry.new
		    @pagy, @ypentries = pagy(Ypentry.all, items: 3)
	  end

	  def create
		    puts "Class: YpentriesController, method: create"
		    @ypentry = Ypentry.new(ypentry_params)
		    if @ypentry.save
			      redirect_to new_ypentry_path, flash: {notice: "Successfully inserted"}
		    else
			      flash[:alert] = "Some errors were found!"
  			    render "new"
		    end
	  end

	  # GET method for editing a product based on id
  	def edit
  		  puts "Class: YpentriesController, method: edit"
    	  @ypentry = Ypentry.find(params[:id])
  	end

  	# PUT method for updating in database a product based on id
  	def update
  		  puts "Class: YpentriesController, method: update"
    	  @ypentry = Ypentry.find(params[:id])
    	  @ypentry.update_attributes(ypentry_params)
      	respond_with @ypentry
  	end
 
 	  # DELETE method for deleting a product from database based on id
  	def destroy
  		  puts "Class: YpentriesController, method: destroy, params: id->" + params[:id]
    	  @ypentry = Ypentry.find(params[:id])
    	  if @ypentry.destroy
      		  redirect_to new_ypentry_path, flash: {notice: "Successfully inserted"}
    	  else
      		  flash[:error] = 'Failed to delete this entry'
      		  render :new
    	  end
  	end

  	private
  	def ypentry_params
    	  params.require(:ypentry).permit(:name, :phone, :address, :zip, :parish)
  	end

end
