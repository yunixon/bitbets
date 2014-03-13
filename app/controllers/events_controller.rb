class EventsController < ApplicationController

  before_action :admin_user, only: [:index, :edit, :create, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @bets = @event.bets
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    event_setup(@event)
    if @event.save
      flash[:success] = "Event added!"
      redirect_to @event
    else
      render 'new'
    end
    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event destroyed."
    redirect_to events_url
  end

private

  def event_setup(the_event)
    if the_event[:complete] == nil
      the_event[:complete] = false
    end
  end

  def admin_user 
    redirect_to(root_url) unless current_user.admin?
  end
  
  def complete(the_event)
    if the_event[:complete] == false
      the_event[:complete] = true
    else
      flash[error] = "Event has already been comleted"
    end
  end

  def event_params
    params.require(:event).permit(:event_type, :name, :fact_link, :first_side, :second_side, :dt_start)
  end

end
