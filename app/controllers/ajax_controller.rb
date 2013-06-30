class AjaxController < ApplicationController


  def cart
    @cart = find_cart
    @cart_values = @cart.items.values
    @quantity = @cart_values.inject(0){ |result, elem| result = result + elem }
    render :json => @quantity
  end

  def cart_price
    @cart = find_cart
    @products = @cart.products_cart(@cart)
    @prices = 0
    for item in @cart.items
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
    render :json => @prices
  end


  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
