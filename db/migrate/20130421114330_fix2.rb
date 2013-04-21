class Fix2 < ActiveRecord::Migration
  def up
    rename_column :categories, :description, :desc
  end

  def down
  end
end
