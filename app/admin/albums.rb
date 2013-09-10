# encoding: utf-8
ActiveAdmin.register Album do

  menu :label => "Альбом"

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование альбома" do
      f.input :title, :label => "Название"
      f.has_many :photos, :through => Photo do |s|
        s.input :file, :as => :file, :label => "Фото", :hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
        s.input :_destroy, :as => :boolean, :label => "Удалить"
      end
    end
    f.buttons
  end

end
