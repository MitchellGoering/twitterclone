class MakeUserIdNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :comments, :user_id, false
    change_column_null :tweets, :user_id, false
    change_column_null :likes, :user_id, false
    change_column_null :comments, :tweet_id, false
  end
end
