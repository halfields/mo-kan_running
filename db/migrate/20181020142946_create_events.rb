class CreateEvents < ActiveRecord::Migration[5.1]
  def change 
  	create_table :events do |t| 
  		t.string :name
  		t.string :date
  		t.string :contact_email
  		t.text :message
  		t.string :location
  		t.string :start_time
  		t.string :website_url
  		t.integer :organizer_id
  		t.timestamps
  	end
  end
end
