# encoding: utf-8
ActiveAdmin.register Album do

  menu :label => "Альбом"

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование альбома" do
      f.input :title, :label => "Название"
      #f.has_many :photos, :through => Photo do |s|
      #  s.input :file, :as => :file, :label => "Фото", :hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
      #  s.input :_destroy, :as => :boolean, :label => "Удалить"
      #end
    end
    f.buttons
  end

  show do
    render "show"
  end

  controller do
    protect_from_forgery :except => :upload_photo

    def upload_photo
      @album = Album.find(params[:id])
      @photo = Photo.new(:file => params[:file], :album_id => params[:id])
      if @photo.save
        render :json => @album.photos.last.file_url(:thumb), :status => :created, :location => @album
        #redirect_to admin_album_path(@album), :notice => 'страница успешно созданна'
      else
        render :new
      end
    end

    def delete_photo
      @photo = Photo.find(params[:id])
      @photo.delete
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
      end
    end

  end

end
