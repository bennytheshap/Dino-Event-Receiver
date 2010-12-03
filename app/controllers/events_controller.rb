class EventsController < ApplicationController
  respond_to :json
  
  def show
    @session = Session.find(params[:session_id])
    @event = Event.find(params[:id])
    respond_with(@session, @event)
  end
  
  def index
    @session = Session.find(params[:session_id])
    @events = @session.events
    respond_with(@session, @events)
  end
  
  def create_bulk
    @session = Session.find(params[:session_id])
    raw_events = params[:events]
    raw_events.each do |raw_event|
      event = Event.new(raw_event)
      event.session = @session
      if !event.save
        return render :json => event.errors, :status => :not_acceptable
      end
    end
    respond_with(@session)
  end
end