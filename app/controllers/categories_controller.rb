class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @meta_title = "Магазин Канапе"
  end

  def category
    @category = Category.find_by_path(params[:id])
    @products = Product.where("category_id = #{@category.id}").order("created_at DESC")
    @meta_title = @category.title
  end

end
