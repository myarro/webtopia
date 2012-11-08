class AddCanonicalUrlToPages < ActiveRecord::Migration
  def up
  	add_column :pages, :canonical_url, :string
  end

  def down
  	remove_column :pages, :canonical_url
  end
end
