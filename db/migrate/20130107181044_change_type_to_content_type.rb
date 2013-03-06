class ChangeTypeToContentType < ActiveRecord::Migration
  def up
  	remove_column :contents, :type
	add_column :contents, :content_type, :string
  end
 
  def down
    add_column :contents, :type, :string
    remove_column :contents, :content_type
  end
end
