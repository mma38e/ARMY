class Club < ActiveRecord::Base
	belongs_to :admin, class_name: 'User', foreign_key: :admin_id
	has_many :memberships
end