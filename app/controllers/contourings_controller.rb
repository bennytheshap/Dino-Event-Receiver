class ContouringsController < ApplicationController
  
  respond_to :json
  
  def show
    @contouring = Contouring.find(params[:id])
    respond_with(@session, @contouring)
  end

  def create
    @contouring = Contouring.new(params[:contouring])
    @session = Session.find(params[:session_id])
    @session.contourings << @contouring
    
    if @contouring.valid? and @session.save
      respond_with(@session, @contouring)
    else
      respond_with(@session, @contouring, :status => :unprocessable_entity)
    end
  end
  
  def new
    @contouring = Contouring.new
    @session = Session.find(params[:session_id])
    respond_with(@session, @contouring)
  end
  
  def update
    @contouring = Contouring.find(params[:id])
    @contouring.update_attributes(params[:contouring])
    if @contouring.save
      respond_with(@session, @contouring)
    else
      respond_with(@session, @contouring, :status => :unprocessable_entity)
    end    
  end

  def index
    @session = Session.find(params[:session_id])
    @contourings = @session.contourings
    respond_with(@session, @contourings)
  end
end