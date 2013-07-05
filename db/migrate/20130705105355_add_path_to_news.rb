class AddPathToNews < ActiveRecord::Migration
  def change
      add_column :news, :path, :string
  end
end
