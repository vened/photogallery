class ProductsController < ApplicationController

  def search
    @result = Product.search(params[:query])
  end



  def show
    @product = Product.find_by_path(params[:id])
    @all_prod = Product.last(3)
    @images = @product.attachments
    @meta_title = @product.title
    @metakey = @product.metakey
    @metadesc = @product.metadesc
  end

  def add_to_cart
    @cart = find_cart
    #product = Product.find(params[:id])
    product = params[:id].to_i
    qa = params[:quantity].to_i
    prod = [product, qa]
    respond_to do |format|
      if @cart.add_product(prod)
        format.js   {}
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { redirect_to :back }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_quantity
    @cart = find_cart
    product = params[:id].to_i
    qa = params[:quantity].to_i
    prod = [product, qa]

    @cart_values = @cart.items.values
    @quantity = @cart_values.inject(0){ |result, elem| result = result + elem }

    respond_to do |format|
      if @cart.update_product(prod)
        format.js   {}
        format.json { render json: @quantity, status: :created, location: @quantity }
      else
        format.html { redirect_to :back }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_item
    @cart = find_cart
    cart_item = params[:id].to_i
    @cart.delete_product(cart_item)
    redirect_to :action => :cart
  end

  def cart
    @cart = session[:cart]
    @products = @cart.products_cart(@cart)
    @prices = 0
    for item in @cart.items
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
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
