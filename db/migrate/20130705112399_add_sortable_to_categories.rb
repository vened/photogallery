class AddSortableToCategories < ActiveRecord::Migration
  def change
      add_column :categories, :sortable, :string
  end
end
