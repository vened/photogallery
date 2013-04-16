# encoding: utf-8
ActiveAdmin.register Product do

  index do
    column "Название", :title, :sortable => :title
    column "Описание", :desc, :sortable => false
    column "Фото", :attachments, :sortable => false do |product|
      render :partial => "index_photo", :object => product
    end
    column "Metakey", :metakey, :sortable => false
    column "Metadesc", :metadesc, :sortable => false
    column "Цена", :price, :sortable => :price
    column "Старая цена", :old_price, :sortable => :old_price
    column "Вес", :weight, :sortable => :weight
    actions :defaults => true
  end

  form(:html => {:multipart => true}) do |f|
    f.inputs "Создание/редактирование продукта" do
      f.input :title, :label => "Название"
      f.input :desc, :label => "Описание"
      f.input :price, :label => "Цена"
      f.input :old_price, :label => "Старая цена"
      f.input :weight, :label => "Вес"
      f.input :metakey, :label => "Metakey"
      f.input :metadesc, :label => "Metadesc"
      f.has_many :attachments, :through => Product do |s|
        s.input :file, :as => :file, :label => "Фото",:hint => s.object.file.nil? ? s.template.content_tag(:span, "Нет фото") : s.template.image_tag(s.object.file_url(:thumb))
        s.input :_destroy, :as => :boolean, :label => "Удалить"
      end
    end
    f.buttons
  end

  show do
    panel product.title do
      attributes_table_for product do
        row("Описание") { product.desc }
        row("Цена") { product.price }
        row("Старая цена") { product.old_price }
        row("Вес") { product.weight }
        row("metakey") { product.metakey }
        row("Metadesc") { product.metadesc }
        product.attachments.each do |at|
          row ("Photo") { image_tag(at.file_url(:thumb)) }
        end
      end
    end
  end

end
