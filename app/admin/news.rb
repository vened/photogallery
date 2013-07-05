# encoding: utf-8
ActiveAdmin.register News do

  menu :label => "Новости"

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование Новости" do
      f.input :title, :label => "Заголовок"
      f.input :desc, :label => "Текст"
      f.input :path, :label => "URL"
      f.has_many :photos, :through => Photo do |s|
        s.input :file, :as => :file, :label => "Фото", :hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
        s.input :_destroy, :as => :boolean, :label => "Удалить"
      end
    end
    f.buttons
  end

  controller do

    def show
      @news = News.find_by_path(params[:id])
    end

    def edit
      @news = News.find_by_path(params[:id])
    end

    def update
      @news = News.find_by_path(params[:id])
      if @news.update_attributes(params[:news])
        redirect_to admin_news_url, notice: 'Новость успешно обновлена'
      else
        render :action => 'edit'
      end
    end

    def destroy
      @news = News.find_by_path(params[:id])
      @news.destroy
      flash[:alert] = "Новость успешно удалена"
      redirect_to admin_news_url
    end

  end


end
