class AddSubjectTagsUserIdToContent < ActiveRecord::Migration
  def up
	add_column :contents, :subject, :string
	add_column :contents, :topics, :string
	add_column :contents, :user_id, :integer
	add_column :contents, :popularity, :integer
  end
 
  def down
    remove_column :contents, :subject
    remove_column :contents, :topics
    remove_column :contents, :user_id
    remove_column :contents, :popularity
  end
end
