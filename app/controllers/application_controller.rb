class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ## uncomment to change landing page after sign in
  #def after_sign_in_path_for(resource)
  #  	memberships_path
  #  end
end
