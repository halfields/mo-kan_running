class CreateEventsRaces < ActiveRecord::Migration[5.1]
  def change
  	create_table :events_races, id: false do |t| 
  		t.integer :event_id 
  		t.integer :race_id 
  	end
  end
end
