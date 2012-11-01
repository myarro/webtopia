class AddLastUserAccess < ActiveRecord::Migration
  def up
  	add_column :users, :last_access_time, :integer
  end

  def down
  	remove_column :users, :last_access_time
  end
end
