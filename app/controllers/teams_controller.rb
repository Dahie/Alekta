class TeamsController < ApplicationController

  before_filter :require_backend_user, :only => [:new, :create, :edit, :destroy, :update]
  before_filter :permission_required, :only => [:new, :create, :edit, :destroy, :update]

  def index
    @teams = Team.find(:all)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @team }
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])
    @team.user = current_user
    @team.

    if @team.save
      flash[:notice] = 'Team was successfully created.'
      redirect_to(@team) 
    else
       render :action => "new" 
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        flash[:notice] = 'Team was successfully updated.'
        format.html { redirect_to(@team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(teams_url) }
      format.xml  { head :ok }
    end
  end
end
