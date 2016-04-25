class Club < ActiveRecord::Base
	belongs_to :admin, class_name: 'User', foreign_key: :admin_id
	has_many :memberships

	def self.search(search)
		where("name Like ?", "%#{search}%")
		where("description Like ?", "%#{search}%")
	end
end