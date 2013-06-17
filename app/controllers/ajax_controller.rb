class AjaxController < ApplicationController


  def cart
    @cart = find_cart
    @cart_values = @cart.items.values
    @quantity = @cart_values.inject(0){ |result, elem| result = result + elem }
    render :json => @quantity
  end


  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
