class ChangeOrganizers < ActiveRecord::Migration[5.1]
  def change
  	change_table :organizers do |t| 
  		t.remove :password
  		t.string :password_digest
  	end
  end
end
