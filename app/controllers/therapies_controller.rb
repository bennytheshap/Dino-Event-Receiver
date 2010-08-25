class TherapiesController < ApplicationController
  respond_to :json
  
  def show
    @therapy = Therapy.find(params[:id])
    respond_with(@session, @therapy)
  end

  def create
    @session = Session.find(params[:session_id])
    @therapy = Therapy.new(params[:therapy])
    if @therapy.save
      respond_with(@session, @therapy)
    else
      respond_with(@session, @therapy, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def update
    @therapy = Therapy.find(params[:id])
    @therapy.update_attributes(params[:therapy])
    if @therapy.save
      respond_with(@session, @therapy)
    else
      respond_with(@session, @therapy, :status => :unprocessable_entity)
    end    
  end
  def index
    @session = Session.find(params[:session_id])
    @therapies = @session.therapies
    respond_with(@session, @therapies)
  end

end