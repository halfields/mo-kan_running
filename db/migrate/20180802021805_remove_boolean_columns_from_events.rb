class RemoveBooleanColumnsFromEvents < ActiveRecord::Migration[5.1]
  def change
  	change_table :events do |t|
  		t.remove :fun_run, :five_k, :ten_k, :half_marathon, :marathon, :ultra
  	end
  end
end
