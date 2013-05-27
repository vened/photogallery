class Cart

  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(prod)
    product = prod[0]
    qa = prod[1]
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity(qa)
    else
      @items << CartItem.new(product)
    end
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

  def delete_product(product_id)
    current_item = @items.find { |item| item.product == product_id }
    #current_item.delete(product)

    @items[0] = nil
    #@items << CartItem.destroy(product_id)
  end

end
