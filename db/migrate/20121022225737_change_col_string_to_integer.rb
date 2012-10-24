class ChangeColStringToInteger < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.change :col1_1, :integer
      t.change :col1_2, :integer
      t.change :col1_3, :integer
      t.change :col1_4, :integer
      t.change :col2_1, :integer
      t.change :col2_2, :integer
      t.change :col2_3, :integer
      t.change :col2_4, :integer
      t.change :col3_1, :integer
      t.change :col3_2, :integer
      t.change :col3_3, :integer
      t.change :col3_4, :integer
      t.change :col4_1, :integer
      t.change :col4_2, :integer
      t.change :col4_3, :integer
      t.change :col4_4, :integer
    end
  end
 
  def self.down
    change_table :pages do |t|
      t.change :col1_1, :string
      t.change :col1_2, :string
      t.change :col1_3, :string
      t.change :col1_4, :string
      t.change :col2_1, :string
      t.change :col2_2, :string
      t.change :col2_3, :string
      t.change :col2_4, :string
      t.change :col3_1, :string
      t.change :col3_2, :string
      t.change :col3_3, :string
      t.change :col3_4, :string
      t.change :col4_1, :string
      t.change :col4_2, :string
      t.change :col4_3, :string
      t.change :col4_4, :string
    end
  end
end
