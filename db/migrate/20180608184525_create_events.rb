class CreateEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table :events do |t| 
  		t.string :name 
  		t.string :date 
  		t.text :contact_info 
  		t.text :message
  end
end
