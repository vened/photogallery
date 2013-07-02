class PagesController < ApplicationController
  include PagesHelper

  def index
    #@pages = Page.nested_set.all
    @cat = Category.all
  end

  def show
    @page = Page.find_by_path(params[:id])
    @metakey = @page.meta_key
    @metadesc = @page.meta_desc
  end
end
