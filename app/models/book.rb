class Book < ApplicationRecord
  belongs_to :user
  has_many :requests

  ACCEPTABLE_STATES = %w( listed requested accepted )
end