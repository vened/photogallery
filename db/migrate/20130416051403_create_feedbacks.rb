class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :username
      t.text :text

      t.timestamps
    end
  end
end
