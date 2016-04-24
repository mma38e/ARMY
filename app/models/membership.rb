class Membership < ActiveRecord::Base
  belongs_to :club
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :club_id, :message => 'There already exist an association between user and club'
end
