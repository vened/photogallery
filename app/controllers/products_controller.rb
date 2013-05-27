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
    qa = params[:quantity]
    prod = [product, qa]
    @cart.add_product(prod)
    redirect_to :back
  end

  def update_quantity
    @cart = find_cart
    product = Product.find(params[:id])
    qa = params[:quantity]
    prod = [product, qa]
    @cart.update_product(prod)
    redirect_to :action => :cart
  end

  def destroy_item
    @cart = find_cart
    #product_id = params[:id]
    product_id = Product.find(params[:id])
    @cart.delete_product(product_id)
    redirect_to :action => :cart
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
