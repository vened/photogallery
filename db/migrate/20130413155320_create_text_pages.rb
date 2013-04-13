class CreateTextPages < ActiveRecord::Migration
  def change
    create_table :text_pages do |t|
      t.string :title
      t.text :desc
      t.string :meta_key
      t.string :meta_desc
      t.references :pages

      t.timestamps
    end
  end
end
