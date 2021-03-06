class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def newsession(user)
    session[:user_id] = user.id
  end

  def removesession
    session[:user_id] = nil
    @current_user = nil
  end
end
