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


  #index do
  #  selectable_column
  #  column "Название", :title, :sortable => :title
  #  column "Описание", :desc, :sortable => false
  #  column "Родитель", :parent_id
  #end
  #
  #form(:html => {:multipart => true}) do |f|
  #  f.inputs "Создание/редактирование продукта" do
  #    f.input :title, :label => "Название"
  #    f.input :desc, :label => "Описание"
  #    f.input :parent_id, :label => "Родитель", :as => :select, :collection => Category.all()
  #  end
  #  f.buttons
  #end
end
