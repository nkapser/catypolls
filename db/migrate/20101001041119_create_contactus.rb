class CreateContactus < ActiveRecord::Migration
  def self.up
    create_table :contactus do |t|
      t.string :from
      t.string :email
      t.string :category
      t.string :subject
      t.string :description
      t.string :status, :default => 'open'
      t.timestamps
    end
  end

  def self.down
    drop_table :contactus
  end
end
