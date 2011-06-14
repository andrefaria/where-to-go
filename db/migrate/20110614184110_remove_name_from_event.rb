class RemoveNameFromEvent < ActiveRecord::Migration
  def self.up
    remone_column :events, :name
  end

  def self.down
    add_column :events, :name, :string
  end
end
