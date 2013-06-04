class OrderController < ApplicationController
  def index
  end

  def new
    @cart = session[:cart]
    @order = Order.new
  end

  def create
    @cart = session[:cart]
    @order = Order.new(params[:order])

    if @order.save
      #session[:cart] = nil
      redirect_to :action => :show, :id => @order.id
      OrderMailer.order_cofirm(@order).deliver
    else
      render :action => :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end


end
