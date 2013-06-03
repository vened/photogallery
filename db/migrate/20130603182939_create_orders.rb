class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :username
      t.string :surname
      t.string :email
      t.string :phone
      t.string :address
      t.string :date
      t.string :first_time
      t.string :last_time
      t.text :comment
      t.text :data
      t.decimal :price

      t.timestamps
    end
  end
end