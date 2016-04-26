class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		redirect_to home_path
  	else
  		redirect_to new_user_session_path	
  	end
  end
  def home
  	@club_users = Club.joins(memberships: :user).where(users: {id: current_user.id}).select('clubs.*, memberships.approved')
		@user = current_user
  end
end
