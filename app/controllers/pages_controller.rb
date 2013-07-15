class PagesController < ApplicationController
  include PagesHelper

  def index
    #@pages = Page.nested_set.all
    @cat = Category.all
  end

  def kanape
    @category = Category.find_by_path('kanape')
    @products = Product.where("category_id = #{@category.id}").order("RANDOM()").limit(6)
  end

  def show
    @page = Page.find_by_path(params[:id])
    if @page.meta_title.nil?
      @meta_title = @page.title
    else
      @meta_title = @page.meta_title
    end
    @metakey = @page.meta_key
    @metadesc = @page.meta_desc
  end

end
