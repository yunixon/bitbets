class BetsController < ApplicationController

  before_action :signed_in_user
  before_action :set_event

  def new
    if @event.complete == false
      @bet = @event.bets.build
    else
      flash[:error] = "Event is completed"
      redirect_to history_path
    end
  end
  
  def create
    @bet =  @event.bets.build(bet_params) 
    @bet.user_id = current_user.id
    if @bet.save
      flash[:success] = "Bet is added!"
      redirect_to root_url
    else
      render "new"
    end
    
  end

  def destroy
  end

  
private
 
  def set_event
    @event = Event.find(params[:event_id])
  end

  def bet_params
    params.require(:bet).permit(:win_type, :sum)
  end

end
