class CreateEventsRaces < ActiveRecord::Migration[5.1]

  def change
  	create_table :events_races, id: false do |t|
  		t.belongs_to :event
  		t.belongs_to :race 
  	end
  end
end
