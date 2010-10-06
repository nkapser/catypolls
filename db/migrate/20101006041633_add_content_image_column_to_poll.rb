class AddContentImageColumnToPoll < ActiveRecord::Migration
  def self.up
    add_column :polls, :photo_file_name,    :string
    add_column :polls, :photo_content_type, :string
    add_column :polls, :photo_file_size,    :integer
    add_column :polls, :photo_updated_at,   :datetime
    
    add_column :polls, :courtesy, :string
  end

  def self.down
    remove_column :polls, :photo_file_name
    remove_column :polls, :photo_content_type
    remove_column :polls, :photo_file_size
    remove_column :polls, :photo_updated_at
    
    remove_column :polls, :courtesy, :string
  end
end
