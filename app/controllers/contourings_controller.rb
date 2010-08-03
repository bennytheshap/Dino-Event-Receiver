class ContouringsController < ApplicationController
  
  respond_to :json
  
  def show
    @contouring = Contouring.find(params[:id])
    #@events = Event.all(:conditions => {'session_id' => @session.id}, :order=>'created_at')
    respond_with(@contouring)
  end

  def create
    @contouring = Contouring.new(params[:contouring])
    if @contouring.save
      respond_with(@contouring)
    else
      respond_with(@contouring, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @contourings = Contouring.all()
    respond_with(@contourings)
  end
end