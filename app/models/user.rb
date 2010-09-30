class User < ActiveRecord::Base
    acts_as_authentic
    
    validates_presence_of :nickname
    validates_uniqueness_of :nickname
end
