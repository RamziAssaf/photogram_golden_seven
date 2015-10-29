class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
  	@database_row = Photo.find_by({ :id => params[:id] })
  end

  def new_form
  	
  end

  def create_row
  	i = Photo.new
	  i.source  = params[:the_source]
	  i.caption = params[:the_caption]
	  i.save
	  redirect_to("http://localhost:3000/photos")
  end
  
  def destroy
  	@database_row = Photo.find_by({ :id => params[:id] })
  	@database_row.destroy
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @database_row = Photo.find_by({ :id => params[:id] })   
  end

  def update_row
    i = Photo.find_by({ :id => params[:id] })
    i.source = params[:the_new_source]
    i.caption = params[:the_new_caption]
    i.save
    render("show")   
  end

end
