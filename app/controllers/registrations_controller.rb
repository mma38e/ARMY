class RegistrationsController < Devise::RegistrationsController
	private

	def sign_up_params
		params.require(:user).permit(:firstName,:lastName, :email, :password, :password_configuration)
	end
	
	def account_update_params
		params.require(:user).permit(:firstName,:lastName, :email, :password, :password_configuration, :current_password)
	end

	def after_inactive_sign_up_path_for(resource)
    	'/verify_email' # Or :prefix_to_your_route
  	end

  	def after_sign_out_path_for(resource)
  		new_user_session_path
  	end
  	private

end	