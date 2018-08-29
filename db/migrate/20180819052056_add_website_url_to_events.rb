class AddWebsiteUrlToEvents < ActiveRecord::Migration[5.1]

  def change
  	add_column :events, :website_url, :string
  end
end
