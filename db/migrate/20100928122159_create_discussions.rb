class CreateDiscussions < ActiveRecord::Migration
  def self.up
    create_table :discussions do |t|
      t.integer :poll_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :discussions
  end
end
