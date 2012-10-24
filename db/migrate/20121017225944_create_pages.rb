class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :description
      t.string :body

      t.timestamps
    end
  end
end
