class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :url
      t.string :topic_1
      t.string :topic_2
      t.string :topic_3
      t.string :topic_4

      t.timestamps
    end
  end
end
