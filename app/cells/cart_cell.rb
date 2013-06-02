class CartCell < Cell::Rails

  def show
    @cart = find_cart
    @cart_values = @cart.items.values
    @quantity = @cart_values.inject(0){ |result, elem| result + elem }
    render
  end

  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
