# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b15b0bc670e3fee17817c27f3f0d8f2f'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
   
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :current_organisation, :action_is?
  
  private
  
  def current_user_session
   return @current_user_session if defined?(@current_user_session)
   @current_user_session = UserSession.find
  end
  
  def current_user
   return @current_user if defined?(@current_user)
   @current_user = current_user_session && current_user_session.user
  end
  
  
  def current_locale
    I18n.locale
  end
  helper_method :current_locale
  
  def require_user
   unless current_user
     store_location
     flash[:notice] = "You must be logged in to access this page"
     redirect_to new_user_session_url
     return false
   end
  end
  
  
  def require_admin
    unless current_user.is_admin?
      redirect_to manage_path
    end
  end
  
  def permission_required
    (is_admin? || is_editor? || is_expert? || is_observer?) ? true : permission_denied
  end
  
  def permission_denied
    flash[:error] = "Sie haben nicht die notwendigen Rechte um diese Seite anzuschauen."
    redirect_to manage_login_path
  end

  def store_location
   session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
   redirect_to(session[:return_to] || default)
   session[:return_to] = nil
  end
  
  def is_admin?
    current_user.is_admin?
  end
  
  
  def is_expert?
    current_user.is_expert?
  end
  
  def is_modder?
    current_user.is_modder?
  end
  
  def is_observer?
    current_user.is_observer?
  end
  
  def action_is?(name)
    if name.is_a?(Array)
      name.any? { |n| action_name == n }
    else
      action_name == name
    end
  end
end
