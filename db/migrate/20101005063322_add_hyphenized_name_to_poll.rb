class AddHyphenizedNameToPoll < ActiveRecord::Migration
  def self.up
    add_column :polls, :name, :string
  end

  def self.down
    remove_column :polls, :name
  end
end
