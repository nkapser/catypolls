require 'paperclip'
 
class User < ActiveRecord::Base
    acts_as_authentic
    
    has_many :polls
    
    validates_presence_of :nickname
    validates_uniqueness_of :nickname
    
    validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'], 
      :message => 'must be a JPEG, GIF or PNG image', 
      :if => Proc.new { |profile| profile.avatar.file? }
    
    has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "75x75>" },
                      :url  => "/assets/avatars/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
    
end
