class PatientVisitsController < ApplicationController
  
  respond_to :json
  
  def show
    @patient_visit = PatientVisit.find(params[:id])
    @session = @patient_visit.session
    respond_with(@session, @patient_visit)
  end

  def create
    @patient_visit = PatientVisit.new(params[:patient_visit])
    @session = Session.find(params[:session_id])
    @session.patient_visits << @patient_visit
    if @patient_visit.valid? and @session.save
      respond_with(@session, @patient_visit) 
    else
      respond_with(@session, @patient_visit, :status => :unprocessable_entity) 
    end
  end
  
  def new
    @patient_visit = PatientVisit.new
    @session = Session.find(params[:session_id])
    respond_with(@session, @patient_visit)
  end

  def index
    @session = Session.find(params[:session_id])
    @patient_visits = @session.patient_visits
    respond_with(@session, @patient_visits)
  end
end