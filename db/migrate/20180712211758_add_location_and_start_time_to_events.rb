class AddLocationAndStartTimeToEvents < ActiveRecord::Migration[5.1]
  def change
  	change_table :events do |t|
  		t.string :location 
  		t.string :start_time 
  	end
  end
end
