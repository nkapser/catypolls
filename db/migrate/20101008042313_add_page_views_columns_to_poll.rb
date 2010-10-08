class AddPageViewsColumnsToPoll < ActiveRecord::Migration
  def self.up
    add_column :polls, :views, :integer, :default => 0
  end

  def self.down
    remove_column :polls, :views
  end
end
