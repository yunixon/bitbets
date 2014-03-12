#require 'doge_api'
require 'blockchain/wallet'

class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @bets = @user.bets
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Please wait... Address assigned"
      @user.payment_address = get_address 
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to BitBets! Your depo address: " + @user.payment_address
        redirect_to @user
      else
        flash[:error] = "Error: Address not assigned. Create a ticket plz"
        redirect_to @user
      end
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def get_address
    #doge_api = DogeApi::DogeApi.new('ncaisu1ucu6fg186rdfmiwap1i')
    #doge_api.get_new_address :address_label => @user.id
    @wallet = Blockchain::Wallet.new("72227c81-2de8-46c8-82f9-a3de74bdfad1", "ZX80ZX80ZX80", nil)
    @wallet.new_address(@user.id)
  end

  def get_balance
    #doge_chain = DogeApi::DogeChain.new
    #doge_chain.addressbalance @user.payment_address
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
