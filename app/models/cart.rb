class Cart

  attr_reader :items

  def initialize
    @items = {}
  end

  def add_product(prod)
    if prod[1] < 1
      @items[prod[0]] = 1
    else
      @items[prod[0]] = prod[1]
    end
  end

  def delete_product(cart_item)
    @items.delete(cart_item)
  end

  def update_product(prod)
    if prod[1] < 1
      pr = {prod[0] => 1}
    else
      pr = {prod[0] => prod[1]}
    end
    @items.update(pr)
  end

  def products_cart(cart)
    product_keys = cart.items.keys
    Product.find(product_keys)
  end

end
