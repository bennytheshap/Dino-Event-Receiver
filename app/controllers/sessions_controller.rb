class SessionsController < ApplicationController
  
  respond_to :json
  
  def show
    @session = Session.find(params[:id])
    #@events = Event.all(:conditions => {'session_id' => @session.id}, :order=>'created_at')
    respond_with(@session)
  end

  def create
    @session = Session.new(params[:session])
    if @session.save
      respond_with(@session)
    else
      respond_with(@session, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @sessions = Session.all()
    respond_with(@sessions)
  end

end