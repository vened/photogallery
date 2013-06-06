# encoding: utf-8
ActiveAdmin.register News do

  menu :label => "Новости"

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование Новости" do
      f.input :title, :label => "Заголовок"
      f.input :desc, :label => "Текст"
      f.has_many :photos, :through => Photo do |s|
        s.input :file, :as => :file, :label => "Фото", :hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
        s.input :_destroy, :as => :boolean, :label => "Удалить"
      end
    end
    f.buttons
  end


end
