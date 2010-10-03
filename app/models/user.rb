require 'paperclip'
 
class User < ActiveRecord::Base
    acts_as_authentic
    
    validates_presence_of :nickname
    validates_uniqueness_of :nickname
    
    
    validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'], 
      :message => 'must be a JPEG, GIF or PNG image', 
      :if => Proc.new { |profile| profile.avatar.file? }
    
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    
end
