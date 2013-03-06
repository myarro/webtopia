class AddBannerToPages < ActiveRecord::Migration
  def up
  	add_column :pages, :main_banner, :string
  end

  def down
  	remove_column :pages, :main_banner
  end
end
