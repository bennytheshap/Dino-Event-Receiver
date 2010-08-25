class BeamChangesController < ApplicationController
  respond_to :json
  
  def show
    @session = Session.find(params[:session_id])
    @therapy = Therapy.where(:id => params[:therapy_id], :session_id => @session.id)
    @beam_change = BeamChange.find(params[:id])
    respond_with(@session, @therapy, @beam_change)
  end

  def create
    @session = Session.find(params[:session_id])
    @therapy = Therapy.find(params[:therapy_id])
    @beam_change = BeamChange.new(params[:beam_change])
    @beam_change.therapy = @therapy
    if @beam_change.save
      respond_with(@session, @therapy, @beam_change)
    else
      respond_with(@session, @therapy, @beam_change, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @session = Session.find(params[:session_id])
    @therapy = Therapy.find(params[:therapy_id])
    @beam_changes = @therapy.beam_changes
    respond_with(@session, @therapy, @beam_changes)
  end

end