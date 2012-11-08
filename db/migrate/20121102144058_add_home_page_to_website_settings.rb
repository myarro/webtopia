class AddHomePageToWebsiteSettings < ActiveRecord::Migration
  def up
  	add_column :website_settings, :home_page, :integer
  end

  def down
  	remove_column :website_settings, :home_Page
  end
end
