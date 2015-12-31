class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  protected
  def authenticate
    if params[:auth_token] && @user = User.find_by(auth_token: params[:auth_token])
      session[:user_id] = @user.id
    else
      @user = User.find(session[:user_id]) if session[:user_id]
      redirect_to root_url unless @user
    end
  end
end
