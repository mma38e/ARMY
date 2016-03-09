class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventName
      t.string :eventLocation
      t.date :eventDate
      t.time :eventTime
      t.text :eventInfo

      t.timestamps null: false
    end
  end
end
