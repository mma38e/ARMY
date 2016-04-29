class AddClubIdToEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :club, index: true, foreign_key: true
  end
end
