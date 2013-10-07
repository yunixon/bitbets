class Bet < ActiveRecord::Base

  validates :user_id,  presence: true
  validates :event_id, presence: true
  validates :win_type, presence: true, numericality: { only_integer: true }
  validates :sum,      presence: true

  belongs_to :event
  belongs_to :user

end
