class CategoriesController < ApplicationController

  def index
    @categories = Category.order("sortable ASC")
    @meta_title = "Магазин Канапе"
  end

  def category
    @categories = Category.order("sortable ASC")
    @category = Category.find_by_path(params[:id])
    @products = Product.where("category_id = #{@category.id}").order("updated_at DESC")
    @meta_title = @category.title
  end

end
