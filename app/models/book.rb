class Book < ApplicationRecord
  belongs_to :user
  has_many :requests

  def sara
    alksjflksajdf;aklsdjfkl;as
  end 

  ACCEPTABLE_STATES = %w( listed requested accepted )
  validates_inclusion_of :state, in: ACCEPTABLE_STATES
  
end