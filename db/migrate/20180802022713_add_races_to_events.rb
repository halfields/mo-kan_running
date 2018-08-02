class AddRacesToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :races, :text, array: true, default: []
  end
end
