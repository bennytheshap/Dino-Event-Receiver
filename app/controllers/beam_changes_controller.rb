class BeamChangesController < ApplicationController
  respond_to :json
  
  def show
    @beam_change = BeamChange.find(params[:id])
    respond_with(@beam_change)
  end

  def create
    @beam_change = BeamChange.new(params[:beam_change])
    if @beam_change.save
      respond_with(@beam_change)
    else
      respond_with(@beam_change, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @beam_changes = BeamChange.all()
    respond_with(@beam_changes)
  end

end