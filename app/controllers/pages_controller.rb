class PagesController < ApplicationController
  def home
    @events = Event.where(complete: false)
    @bets = Bet.all
  end
  
  def history
    @events = Event.where(complete: true)
  end

  def help
  end

  def about
  end

  def faq
  end

  def tutorial
  end

  def affiliate
  end

end
