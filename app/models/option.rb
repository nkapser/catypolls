class Option < ActiveRecord::Base
  belongs_to :poll
  
  validates_presence_of :name, :message => 'Option cannot be blank'
  
  def update_count!
    self.counter = self.counter + 1
    save
  end
end
