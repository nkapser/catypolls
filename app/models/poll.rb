require 'digest/md5'
class Poll < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :options
  has_many :discussions
  accepts_nested_attributes_for :options, :allow_destroy => true

  validates_presence_of :question
  validates_presence_of :description, :message => 'for poll cannot be blank'


  has_attached_file :photo, :styles => { :medium => "300x200>" },
                    :url  => "/assets/polls/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/polls/:id/:style/:basename.:extension"

  validates_attachment_presence :photo, :if => Proc.new { |profile| profile.photo.file? }

  validates_attachment_size :photo, :less_than => 200.kilobytes, :if => Proc.new { |profile| profile.photo.file? }
  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'], 
    :message => 'must be a JPEG, GIF or PNG image', 
    :if => Proc.new { |profile| profile.photo.file? }
    
  before_create :hyphenize_name

  def self.fetch_all_active(category, page, per_page)
      self.paginate :page => page, :order => 'updated_at DESC', :conditions => ["is_active = ? and category_id = ?", true, self.get_category_id(category)], :per_page => per_page
  end
  
  def publish!
    self.update_attributes!({:is_active => true, :uniqueid => generate_unique_id})
  end
  
  def is_published?
    self.is_active
  end
  
  def update_vote(o)
    options.each {|option| 
      if option.id == o.to_i 
        op = Option.find(option.id)
        op.update_count!  
      end
      }
  end
  
  def discussions_by_latest(page)
    self.discussions.fetch_by_latest(page)
  end
  
  def self.search(query = '', category = 'General', page = 1)
      self.paginate :page => page, :order => 'updated_at DESC', :conditions => ["is_active = ? and category_id = ? and question like ?", true, self.get_category_id(category), "%#{query}%"], :per_page => per_page    
  end
  
  private
  def self.get_category_id(category_name)
    category = Category.find_by_name(category_name)
    category.nil? ? nil : category.id
  end
  
  def generate_unique_id
    Digest::MD5.hexdigest(question.gsub(/[^a-zA-Z0-9]/, '-')+Time.now.to_s)
  end
  
  def hyphenize_name
    self.name = question.gsub(/[^a-zA-Z0-9]/, '-')
  end
end
