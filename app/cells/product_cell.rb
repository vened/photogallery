class ProductCell < Cell::Rails

  def home_page
    @category = Category.all
    render
  end

end
