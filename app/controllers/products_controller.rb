class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.attachments
    @metakey = @product.metakey
    @metadesc = @product.metadesc
  end

end
