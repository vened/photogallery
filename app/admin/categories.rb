# encoding: utf-8
ActiveAdmin.register Category do

  menu :label => "Категории продуктов"


  action_item :only => :show do
    link_to "New Category", new_admin_category_path
  end

  controller do

    def show
      @category = Category.find_by_path(params[:id])
    end

    def edit
      @category = Category.find_by_path(params[:id])
    end

    def update
      @category = Category.find_by_path(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to admin_category_url, notice: 'Категория успешно обновлена'
      else
        render :action => 'edit'
      end
    end

    def destroy
      @category = Category.find_by_path(params[:id])
      @category.destroy
      flash[:alert] = "Категория успешно удалена"
      redirect_to admin_categories_url
    end

  end

end
