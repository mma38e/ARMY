class AddIncomingToMemberships < ActiveRecord::Migration
  def change
  	add_column :memberships, :incoming, :boolean
  end
end
