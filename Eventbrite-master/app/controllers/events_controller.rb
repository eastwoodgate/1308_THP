class EventsController < ApplicationController
  def index
  end

  def show
    @id = params[:id]
    @event = Event.all.find(params[:id])
  end

  def new
    @event = Event.new
  end
end
