class Fix < ActiveRecord::Migration
  def up
    remove_column :products, :old_price, :decimal
  end

  def down
  end
end
