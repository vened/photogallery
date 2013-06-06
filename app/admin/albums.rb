# encoding: utf-8
ActiveAdmin.register Album do

  menu :label => "Портфолио"

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование портфолио" do
      f.input :title, :label => "Название"
      f.input :desc, :label => "Описание"
      f.has_many :photos, :through => Photo do |s|
        s.input :file, :as => :file, :label => "Фото", :hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
        s.input :_destroy, :as => :boolean, :label => "Удалить"
      end
    end
    f.buttons
  end

end
