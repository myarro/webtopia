class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :subject
      t.string :body
      t.string :tags
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
