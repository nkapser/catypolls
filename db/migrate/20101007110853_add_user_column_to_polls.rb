class AddUserColumnToPolls < ActiveRecord::Migration
  def self.up
    add_column :polls, :user_id, :integer
  end

  def self.down
    remove_column :polls, :user_id
  end
end
