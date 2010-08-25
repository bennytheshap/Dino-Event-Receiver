class ContouringMouseMovementsController < ApplicationController
  respond_to :json
  
  def show
    @session = Session.find(params[:session_id])
    @contouring = Contouring.find(params[:contouring_id])
    @cmm = ContouringMouseMovement.find(params[:id])
    respond_with(@session, @beam_change, @cmm)
  end

  def create
    @session = Session.find(params[:session_id])
    @contouring = Contouring.find(params[:contouring_id])
    @cmm = ContouringMouseMovement.new(params[:contouring_mouse_movement])
    @cmm.contouring = @contouring
    if @beam_change.save
      respond_with(@session, @contouring, @cmm)
    else
      respond_with(@session, @contouring, @cmm, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @session = Session.find(params[:session_id])
    @contouring = Contouring.find(params[:contouring_id])
    @cmms = @contouring.mouse_movements
    respond_with(@session, @therapy, @cmms)
  end

end