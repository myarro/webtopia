class AddLastAccessAndLoggedIn < ActiveRecord::Migration
  def up
  	add_column :users, :last_access, :string
  	add_column :users, :logged_in, :string
  end

  def down
  	remove_column :users, :last_access
  	remove_column :users. :logged_in
  end
end
