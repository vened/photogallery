class PagesController < ApplicationController
  include PagesHelper

  def index
    #@pages = Page.nested_set.all
    @cat = Category.all
  end

  def kanape
    @category = Category.find_by_path('kanape')
    @products = Product.where("category_id = #{@category.id}").order("RANDOM()").limit(6)
    @cart = session[:cart]
    @prices = 0
    for item in @cart.items
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
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
