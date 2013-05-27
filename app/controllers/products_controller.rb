class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.attachments
    @metakey = @product.metakey
    @metadesc = @product.metadesc
  end

  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
  end

  def cart
    @cart = session[:cart]
  end


  def empty_cart
    session[:cart] = nil
    flash[:notice] = "cart empty!"
    redirect_to :action => :index
  end

  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
