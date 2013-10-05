class Event < ActiveRecord::Base
  
  validates: type, presence: true, length: {maximum: 120}
  validates: name, presence: true, length: {maximum: 120}

  has_many :bets

end
