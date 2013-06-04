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
      #@order_data = Order.where(:id => @order.id).create(:data => "sdcasdc")
      #@order_data.save
      redirect_to :action => :show, :id => @order.id
    else
      render :action => :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end


end
