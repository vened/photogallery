class OrderController < ApplicationController
  def index
  end

  def new
    @cart = session[:cart]
    @order = Order.new
    @prices = 0
    for item in @cart.items
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
  end

  def create
    @cart = session[:cart]
    @prices = 0
    for item in @cart.items
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
    @order = Order.new(params[:order])
    if @order.save
      session[:cart] = nil
      redirect_to :action => :show, :id => @order.id
      OrderMailer.order_cofirm(@order).deliver
      OrderMailer.order_cofirm_user(@order).deliver
    else
      render :action => :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @prices = 0
    for item in JSON.parse(@order.data)
      product = Product.find(item[0])
      @prices = @prices + product.price.to_i * item[1]
    end
  end

end
