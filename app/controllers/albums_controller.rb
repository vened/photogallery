class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    @meta_title = "Проекты Фото"
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
    @meta_title = @album.title
    #render :json => @photos
  end


end
