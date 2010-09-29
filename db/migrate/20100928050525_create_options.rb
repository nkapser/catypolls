class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :name
      t.integer :counter, :default => 0
      t.integer :poll_id
    end
  end

  def self.down
    drop_table :options
  end
end
