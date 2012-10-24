class AddContentToPagesDropBody < ActiveRecord::Migration
  def up
  		remove_column :pages, :body
  		add_column :pages, :url, :string
  		add_column :pages, :header_special, :string
  		add_column :pages, :col_layout, :integer 
  		add_column :pages, :col1_1, :string
  		add_column :pages, :col1_2, :string
  		add_column :pages, :col1_3, :string
  		add_column :pages, :col1_4, :string
  		add_column :pages, :col2_1, :string
  		add_column :pages, :col2_2, :string
  		add_column :pages, :col2_3, :string
  		add_column :pages, :col2_4, :string
  		add_column :pages, :col3_1, :string
  		add_column :pages, :col3_2, :string
  		add_column :pages, :col3_3, :string
  		add_column :pages, :col3_4, :string
  		add_column :pages, :col4_1, :string
  		add_column :pages, :col4_2, :string
  		add_column :pages, :col4_3, :string
  		add_column :pages, :col4_4, :string
  end

  def down
  		add_column :pages, :body, :string
  end
end
