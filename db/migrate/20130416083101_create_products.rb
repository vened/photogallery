class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.string :metakey
      t.string :metadesc
      t.decimal :price, :scale => 2
      t.decimal :weight
      t.references :category

      t.timestamps
    end
  end
end
