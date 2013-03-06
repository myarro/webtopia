class AddTypeAndDescriptionToContent < ActiveRecord::Migration
  def up
	add_column :contents, :type, :string
	add_column :contents, :description, :string
  end
 
  def down
    remove_column :contents, :type
    remove_column :contents, :description
  end
end
