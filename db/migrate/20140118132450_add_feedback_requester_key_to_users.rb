class AddFeedbackRequesterKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :feedback_request_key, :string
    add_index :users, :feedback_request_key, unique: true
  end
end
