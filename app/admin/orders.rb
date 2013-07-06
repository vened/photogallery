# encoding: utf-8
ActiveAdmin.register Order do

  menu :label => "Заказы"
  config.batch_actions = false

  filter :username, :label => "asdcd"


  index do
    render "index"
  end


  #index do
  #  column "Номер заказа", :id, :sortable => :id
  #  column "Имя", :username, :sortable => false
  #  column "Фамилия", :surname, :sortable => false
  #  actions :defaults => true
  #end


end
