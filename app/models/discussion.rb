class Discussion < ActiveRecord::Base
  belongs_to :poll
  belongs_to :user
  
  def self.fetch_by_latest(page)
    self.paginate :page => page, :order => 'updated_at DESC', :per_page => 10
  end
  
end
