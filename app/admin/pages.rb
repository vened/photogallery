# encoding: utf-8
ActiveAdmin.register Page do

  index do
    column :title
    column :parent_path
  end


  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :path
      f.input :parent_id, :as => :select, :collection => nested_set_options(Page, @page) { |i| "#{'-' * i.level} #{i.title}" }
    end
    f.buttons
  end

  member_action :new do
    @page = Page.new
  end

  member_action :create do
    @page = Page.new(params[:page])
    if @page.save
      redirect_to admin_pages_url, notice: 'страница успешно созданна'
    else
      render :new
    end
  end

  member_action :edit do
    @page = Page.find_by_path(params[:id])
  end

  member_action :update do
    @page = Page.find_by_path(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to admin_page_path, notice: 'страница успешно обновлена'
    else
      render :action => 'edit'
    end
  end

  member_action :show do
    @page = Page.find_by_path(params[:id])
  end

  member_action :destroy do
    @page = Page.find_by_path(params[:id])
    @page.destroy
    flash[:alert] = "Страница успешно удалена"
    redirect_to admin_pages_url
  end

end
