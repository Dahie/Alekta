class UsersController < ApplicationController

  before_filter :require_admin, :only => [:destroy]
  before_filter :require_user, :only => [:edit, :update]
  before_filter :permission_required, :only => [:destroy, :update]

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'User was successfully created.'
      format.html { redirect_to(@user) }
    else
      format.html { render :action => "new" }
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end
end
