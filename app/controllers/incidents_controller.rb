class IncidentsController < ApplicationController
  load_and_authorize_resource
  def index
    @incidents = Incident.get_collection current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidents }
    end
  end

  def show
    @incident  = Incident.find(params[:id])
    @assigned  = @incident.assigned
    @requester = @incident.requester
    @creator   = @incident.creator

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident }
    end
  end

  def new
    @incident = Incident.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident }
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def create
    @incident = Incident.new(params[:incident])

    respond_to do |format|
      if @incident.save
        @incident.set_creator current_user
        
        format.html { redirect_to @incident, notice: t('incidents.messages.successfull_created') }
        format.json { render json: @incident, status: :created, location: @incident }
      else
        format.html { render action: "new" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @incident = Incident.find(params[:id])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html { redirect_to @incident, notice: t('incidents.messages.successfull_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy

    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end
end
