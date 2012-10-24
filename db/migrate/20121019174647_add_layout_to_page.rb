class AddLayoutToPage < ActiveRecord::Migration
  def up
  		add_column :pages, :page_layout, :string
  end

  def down
  		remove_column :pages, :page_layout
  end
end
