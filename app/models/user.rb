class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :clubs_as_admin, class_name: 'Club', foreign_key: :admin_id
  has_many :memberships

  def already_member(club, user)
  	@memberships = Membership.where(club_id: club, user_id: user)
  	@memberships.each do |membership|
  		return true
  	end
  		return false
  end
end
