class AddListNameToList < ActiveRecord::Migration
  def up
  	add_column :lists, :list_name, :string
  end

  def down
  	remove_column :lists, :list_name
  end
end
