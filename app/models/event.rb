class Event < ActiveRecord::Base
  
  validates :name,        presence: true
  validates :first_side,  presence: true
  validates :second_side, presence: true

  has_many :bets, dependent: :destroy #Delete bets with event 
  default_scope -> { order('created_at DESC') } #New on top

end
