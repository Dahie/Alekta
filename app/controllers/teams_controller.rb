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
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])
    @team.user = current_user

    if @team.save
      flash[:notice] = 'Team was successfully created.'
      redirect_to(@team) 
    else
       render :action => "new" 
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      flash[:notice] = 'Team was successfully updated.'
      redirect_to(@team) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to(teams_url) 
  end
end
