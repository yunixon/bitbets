class BetsController < ApplicationController

  before_action :signed_in_user
  
  def create
    @bet = current_user.bets.build(bet_params)
    if @bet.save
      flash.now[:success] = "Bet is added!"
      redirect_to root_url
    else
      flash.now[:error] = "Error"
    end
    
  end

  def destroy
  end

  
private
  
  def bet_params
    params.require(:bet).permit(:event_id, :win_type, :sum)
  end

end
