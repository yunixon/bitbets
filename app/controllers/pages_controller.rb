class PagesController < ApplicationController
  def home
    @events = Event.where(complete: false)
  end

  def help
  end

  def about
  end

  def faq
  end

  def tutorial
  end

  def history
  end

  def affiliate
  end

end
