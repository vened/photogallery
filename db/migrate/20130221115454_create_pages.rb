class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

      t.string :title
      t.string :meta_key
      t.string :meta_desc

      t.string :path

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth # this is optional.

      t.timestamps

      #подключение текстового модуля
      t.boolean :include_text_page, :default => false

    end
  end
end
