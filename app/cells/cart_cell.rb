class CartCell < Cell::Rails

  def show
    @cart = find_cart
    render
  end

  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
