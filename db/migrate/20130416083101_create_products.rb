class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.string :metakey
      t.string :metadesc
      t.decimal :price
      t.decimal :old_price
      t.decimal :weight

      t.timestamps
    end
  end
end
