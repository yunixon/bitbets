class User < ActiveRecord::Base

  before_save { self.name  = name.downcase  }
  #before_save { self.email = email.downcase }
  before_create :create_remember_token


  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :payment_address, length: { is: 36 } 
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :bets

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
