class UsersController < ApplicationController
	def my_portfolio
		@user_memberships = Club.joins(memberships: :user).where(users: {id: current_user.id})
		@user = current_user
	end
end