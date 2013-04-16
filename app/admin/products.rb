# encoding: utf-8
ActiveAdmin.register Product do


  #form :partial => "form"
  #form(:html => { :multipart => true }) do |f|
  #  f.inputs "Club" do
  #    f.input :title
  #    f.input :file, :as => :file
  #  end
  #  f.buttons
  #end


  form(:html => { :multipart => true }) do |f|
    f.inputs "Project Details" do
      f.input :title
      f.has_many :attachments, :through => Product do |s|
        s.input :file, :as => :file
      end
    end
    f.buttons
  end

end
