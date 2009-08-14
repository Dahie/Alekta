class UserSessionsController < ApplicationController
  skip_before_filter :require_backend_user,      :except => :destroy
  skip_before_filter :permission_required, :except => :destroy
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default mods_path
    else
      flash[:notice] = "Login denied!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_path
  end
end
