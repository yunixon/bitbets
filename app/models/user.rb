require 'doge_api'
#require 'blockchain/wallet'

class User < ActiveRecord::Base

  before_save { self.name  = name.downcase  }
  #before_save { self.email = email.downcase }
  before_create :create_remember_token
  after_create :get_address

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #validates :payment_address, length: { is: 36 } 
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


  #def set_address
  #  @user.payment_address = get_address
  #end

private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

  def get_address
    doge_api = DogeApi::DogeApi.new('ncaisu1ucu6fg186rdfmiwap1i', version=2)
    t = JSON.parse(doge_api.create_user :user_id => self.id)
    self.update_attribute(:payment_address, t["data"]["address"].to_s)
    
    #wallet = Blockchain::Wallet.new("72227c81-2de8-46c8-82f9-a3de74bdfad1", "ZX80ZX80ZX80", nil)
    #self.payment_address = wallet.new_address(self.id)

    #if self.save
    #  flash[:success] = "Adress is assigned: " + self.payment_address
    #else
    #  flash[:danger] = "Address not assigned. Please create ticket..."
    #end
  end

  def get_user_balance
    #doge_chain = DogeApi::DogeChain.new
    #doge_chain.addressbalance @user.payment_address
  #  self.amount
  end

#flash[:success] = "Please wait... Address assigned" 
#      if @user.save
#else
#        flash[:danger] = "Error: Address not assigned. Create a ticket plz"
#        redirect_to @user
#      end
#end
end