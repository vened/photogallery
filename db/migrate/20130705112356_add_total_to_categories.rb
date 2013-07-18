class AddTotalToCategories < ActiveRecord::Migration
  def change
      add_column :categories, :total, :string
  end
end
