class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comments

      t.timestamps
    end

    add_reference :comments, :user, foreign_key: true, index: true
    add_reference :comments, :tweet, foreign_key: true, index: true
  end
end
