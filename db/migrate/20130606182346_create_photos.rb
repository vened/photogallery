class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.references :album

      t.timestamps
    end
    add_index :photos, :id
    add_index :photos, :album_id
  end
end
