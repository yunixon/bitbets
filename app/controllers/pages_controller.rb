class PagesController < ApplicationController
  def home
    @events = Event.where(complete: false)
    #@bets_first_sum = Bet.where()
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
