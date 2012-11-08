class CreateWebsiteSettings < ActiveRecord::Migration
  def change
    create_table :website_settings do |t|
      t.integer :session_time_out

      t.timestamps
    end
  end
end
