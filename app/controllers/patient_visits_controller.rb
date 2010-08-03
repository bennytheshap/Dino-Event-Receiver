class PatientVisitsController < ApplicationController
  
  respond_to :json
  
  def show
    @patient_visit = PatientVisit.find(params[:id])
    #@events = Event.all(:conditions => {'session_id' => @session.id}, :order=>'created_at')
    respond_with(@patient_visit)
  end

  def create
    @patient_visit = PatientVisit.new(params[:patient_visit])
    if @patient_visit.save
      respond_with(@patient_visit)
    else
      respond_with(@patient_visit, :status => :unprocessable_entity)
    end
  end
  
  def new
  end

  def index
    @patient_visits = PatientVisit.all()
    respond_with(@patient_visits)
  end
end