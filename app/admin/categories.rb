# encoding: utf-8
ActiveAdmin.register Category do

  menu :label => "Категории продуктов"

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
