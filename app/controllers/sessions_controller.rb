class SessionsController < ApplicationController
  
  respond_to :json
  
  def show
    @session = Session.find(params[:id])
    #@events = Event.all(:conditions => {'session_id' => @session.id}, :order=>'created_at')
    respond_with(@session)
  end

  def create
    @session = Session.new
    if params.has_key? :user
      @username = params[:user][:username]
      password = params[:user][:password]
      @user = User.where(:username => @username).limit(1).first
      if @user and @user.valid_password? password
        @session.user = @user
      else
        return render :text => "invalid password", :status => :not_acceptable
      end
    end
    
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