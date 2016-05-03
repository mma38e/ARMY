class HomeController < ApplicationController
  def index
    # if user has not signed in redirect to login page
  	if user_signed_in?
  		redirect_to home_path
  	else
  		# redirect_to new_user_session_path	
  	end
  end
  def home
  	@club_users = Club.joins(memberships: :user).where(users: {id: current_user.id}).select('clubs.*, memberships.approved, memberships.incoming, memberships.user_id, memberships.id as memberships_id')
		@user = current_user
  end

end
