class AddDetailsToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :fun_run, boolean: :false
  	add_column :events, :five_k, boolean: :false
  	add_column :events, :ten_k, boolean: :false
  	add_column :events, :half_marathon, boolean: :false
  	add_column :events, :marathon, boolean: :false
  	add_column :events, :ultra, boolean: :false
  end
end
