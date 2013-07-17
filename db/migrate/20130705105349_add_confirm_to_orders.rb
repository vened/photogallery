class AddConfirmToOrders < ActiveRecord::Migration
  def change
      add_column :orders, :confirm, :string
  end
end
