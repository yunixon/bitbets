class BetsController < ApplicationController

  before_action :signed_in_user
  before_action :set_event

  def new
    @bet = @event.bets.build
  end
  
  def create
    @bet = @event.bets.build(bet_params)
    @bet.user_id = current_user.id
    bet_setup(@bet)

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
 
  def bet_setup
    
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def bet_params
    params.require(:bet).permit(:win_type, :sum)
  end

end
