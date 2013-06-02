class Cart

  attr_reader :items

  def initialize
    @items = {}
  end

  def add_product(prod)
    if prod[1] < "1"
      @items[prod[0]] = "1"
    else
      @items[prod[0]] = prod[1]
    end
  end

  def delete_product(cart_item)
    @items.delete(cart_item)
  end

  def update_product(prod)
    product = prod[0]
    qa = prod[1]
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.update_quantity(qa)
    else
      @items << CartItem.new(product)
    end
  end

end
