class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :description
      t.string :question
      t.boolean :is_active, :default => false
      t.datetime :start_date, :end_date
      t.string :uniqueid
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
