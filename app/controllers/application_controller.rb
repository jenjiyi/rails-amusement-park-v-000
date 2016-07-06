class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user
   # def current_user
   #    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   #  end
    
  private

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end


  def logged_in?
    current_user.id != nil
  end

   helper_method :current_user, :logged_in?



end
