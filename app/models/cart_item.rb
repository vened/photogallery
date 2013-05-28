class CartItem

  attr_reader :product, :quantity, :id, :title

  def initialize(prod)
    product = prod[0]
    qa = prod[1]
    @product = product
    @quantity = qa.to_i
    @id_product = product.id
  end

  def increment_quantity(qa)
    if qa.to_i > 1
      @quantity = qa.to_i
    else
      @quantity = 1
    end
  end

  def update_quantity(qa)
    if qa.to_i > 1
      @quantity = qa.to_i
    else
      @quantity = 1
    end
  end

  def id
    @product.id
  end

  def title
    @product.title
  end

  def price
    @product.price * @quantity
  end

end