class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def category
    @category = Category.find_by_path(params[:id])
    @products = Product.where("category_id == #{@category.id}").order("created_at DESC")
  end

  def show
    @product = Product.find_by_path(params[:id])
    @images = @product.attachments
    @metakey = @product.metakey
    @metadesc = @product.metadesc
  end

  def add_to_cart
    @cart = find_cart
    #product = Product.find(params[:id])
    product = params[:id].to_i
    qa = params[:quantity].to_i
    prod = [product, qa]
    @cart.add_product(prod)
    redirect_to :back
  end

  def update_quantity
    @cart = find_cart
    product = params[:id].to_i
    qa = params[:quantity].to_i
    prod = [product, qa]
    @cart.update_product(prod)
    redirect_to :action => :cart
  end

  def destroy_item
    @cart = find_cart
    cart_item = params[:id].to_i
    @cart.delete_product(cart_item)
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
