class AddLikesToTweets < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :tweet, foreign_key: true
  end
end
