class PagesController < ApplicationController
  include PagesHelper

  def index
    @albums = Album.all
  end
  #
  #def show
  #  @page = Page.find_by_path(params[:id])
  #  #if @page.meta_title.nil?
  #  #  @meta_title = @page.title
  #  #else
  #  #  @meta_title = @page.meta_title
  #  #end
  #  #@metakey = @page.meta_key
  #  #@metadesc = @page.meta_desc
  #end

end
