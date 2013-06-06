class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :desc
      t.string :meta_key
      t.string :meta_desc

      t.timestamps
    end
    add_index :news, :title
  end
end
