# encoding: utf-8
ActiveAdmin.register Category do

  menu :label => "Категории продуктов"


  action_item :only => :show do
    link_to "New Category", new_admin_category_path
  end

  form do |f|
    f.inputs "Создание/редактирование Категории" do
      f.input :title, :label => "Заголовок"
      f.input :description, :label => "Описание"
      f.input :path, :label => "URL"
      f.input :total, :label => "Минимальное кол-во в заказе", :as => :select, :collection => [['1','1'], ['10','10']]
    end
    f.buttons
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
