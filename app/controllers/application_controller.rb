class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected
  
  def check_pass!
    if pass_signed_in?
      redirect_to :user_path and return
    else
      return true
    end
  end

  def authenticate_pass!
    if pass_signed_in?
      super
    else
      flash[:notice] = "Please sign in to continue" 
      redirect_to :login and return
    end
  end
end
