class RenameColumnInEvents < ActiveRecord::Migration[5.1]

  def change
  	change_table :events do |t|
  		t.rename :contact_info, :contact_email
  	end
  end
end

