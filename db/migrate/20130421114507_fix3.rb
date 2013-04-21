class Fix3 < ActiveRecord::Migration
  def up
    rename_column :categories, :descr, :desc
  end

  def down
  end
end
