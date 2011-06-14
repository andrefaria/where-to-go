class AddPlaceToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :place, :string
  end

  def self.down
    remove_column :events, :place
  end
end
