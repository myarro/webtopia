class AddHtmlFileLayoutFileHeadFileBody110FooterFileEndFileToPage < ActiveRecord::Migration
  def up
	add_column :pages, :html_file , :string
	add_column :pages, :head_file , :string
	add_column :pages, :layout_file, :string
	add_column :pages, :body_1, :string
	add_column :pages, :body_2, :string
	add_column :pages, :body_3, :string
	add_column :pages, :body_4, :string
	add_column :pages, :body_5, :string
	add_column :pages, :body_6, :string
	add_column :pages, :body_7, :string
	add_column :pages, :body_8, :string
	add_column :pages, :body_9, :string
	add_column :pages, :body_10, :string
	add_column :pages, :footer_file, :string
	add_column :pages, :end_of_page_file, :string
  end
 
  def down
    remove_column :pages, :html_file
    remove_column :pages, :head_file
    remove_column :pages, :layout_file
    remove_column :pages, :body_1
    remove_column :pages, :body_2
    remove_column :pages, :body_3
    remove_column :pages, :body_4
    remove_column :pages, :body_5
    remove_column :pages, :body_6
    remove_column :pages, :body_7
    remove_column :pages, :body_8
    remove_column :pages, :body_9
    remove_column :pages, :body_10
    remove_column :pages, :footer_file
    remove_column :pages, :end_of_page_file
  end
end
