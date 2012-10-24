class AddUrlPages < ActiveRecord::Migration
  def up
  		add_column :pages, :section1, :string
  		add_column :pages, :section2, :string
  		add_column :pages, :section3, :string
  		add_column :pages, :section4, :string
  		add_column :pages, :page_name, :string
  end

  def down
  		remove_column :pages, :section1
  		remove_column :pages, :section2
  		remove_column :pages, :section3
  		remove_column :pages, :section4
  		remove_column :pages, :page_name  		
  end
end
