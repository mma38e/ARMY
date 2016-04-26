class Club < ActiveRecord::Base
	belongs_to :admin, class_name: 'User', foreign_key: :admin_id
	has_many :memberships

	# used for the search bar to find a club
	def self.search(search)
	  if search
	    where("name Like ?", "%#{search}%")
		where("description Like ?", "%#{search}%")
	  else

	  end
	end
end