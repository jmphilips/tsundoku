class Request < ApplicationRecord
  belongs_to :giver, :class_name => 'User'
  belongs_to :taker, :class_name => 'User'
  belongs_to :book
  has_many :users
end
