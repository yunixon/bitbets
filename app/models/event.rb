class Event < ActiveRecord::Base
  
  validates :name,        presence: true, length: { maximum: 120 }
  validates :first_side,  presence: true, length: { maximum: 80 }
  validates :second_side, presence: true, length: { maximum: 80 }

  has_many :bets 
  accepts_nested_attributes_for :bets
  
  default_scope -> { order('created_at DESC') } #New on top

end
