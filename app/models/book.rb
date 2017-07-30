class Book < ApplicationRecord
  belongs_to :user
  has_many :requests

  ACCEPTABLE_STATES = %w( listed requested accepted )
  validates_inclusion_of :state, in: ACCEPTABLE_STATES
  
end