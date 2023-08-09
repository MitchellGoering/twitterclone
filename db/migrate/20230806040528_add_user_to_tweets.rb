class AddUserToTweets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :user, index: true
    add_foreign_key :tweets, :users, column: :user_id
  end
end
