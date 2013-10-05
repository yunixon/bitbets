class BetsController < ApplicationController

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      flash.now[:success] = "Bet is added!"
      redirect_to home_path
    else
      flash.now[:error] = "Error"
    end
    
  end

  def destroy
  end

  
private
  
  def bet_params
    params.require(:bet).permit(:sum)
  end

end
