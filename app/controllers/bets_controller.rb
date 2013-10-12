class BetsController < ApplicationController

  before_action :signed_in_user
  
  def new
    @event = Event.find(params[:event_id])
    @bet = @event.bets.build
  end
  
  def create
    @event = Event.find(params[:event_id])
    @bet = @event.bets.build(params[bet_params])
    @bet.win_type = 1
    @bet.user_id = current_user.id
    
    if @bet.save
      flash.now[:success] = "Bet is added!"
      redirect_to root_url
    else
      render 'new'
    end
    
  end

  def destroy
  end

  
private
  
  def bet_params
    params.require(:bet).permit(:event_id, :win_type, :sum)
  end

end
