class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.integer :user_id
      t.string :giver_email

      t.timestamps
    end
    add_index :feedbacks, [:user_id, :created_at]
  end
end
