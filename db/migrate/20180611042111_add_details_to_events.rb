class AddDetailsToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :fun_run, :boolean, default: false
  	add_column :events, :five_k, :boolean, default: false
  	add_column :events, :ten_k, :boolean, default: false
  	add_column :events, :half_marathon, :boolean, default: false
  	add_column :events, :marathon, :boolean, default: false
  	add_column :events, :ultra, :boolean, default: false
  end
end
