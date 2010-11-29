class EventsController < ApplicationController
  respond_to :json
  
  def create_bulk
    @session = Session.find(params[:session_id])
    @raw_events = params[:events]
    @raw_events.each do |raw_event|
      @event = Event.new(raw_event)
      @event.save
    end
    respond_with(@session)
  end
end