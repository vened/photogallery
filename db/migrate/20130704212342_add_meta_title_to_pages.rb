class AddMetaTitleToPages < ActiveRecord::Migration
  def change
    add_column :pages, :meta_title, :string
  end
end
