class Event < ActiveRecord::Base
  
  validates :name,        presence: true
  validates :first_side,  presence: true
  validates :second_side, presence: true

  has_many :bets 
  accepts_nested_attributes_for :bets
  
  default_scope -> { order('created_at DESC') } #New on top

end
