class Bet < ActiveRecord::Base

  validates :user_id,  presence: true
  validates :event_id, presence: true
  validates :win_type, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 3}
  validates :sum,      presence: true, numericality: { greater_than: 0 }

  belongs_to :event
  belongs_to :user

end
