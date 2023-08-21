class Tweet < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :delete_all
    accepts_nested_attributes_for :comments
    has_many :likes, dependent: :delete_all
end
