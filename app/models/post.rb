class Post < ActiveRecord::Base
  belongs_to :club
  belongs_to :user
  has_many :comments
end
