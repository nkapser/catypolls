class Contactus < ActiveRecord::Base

  validates_presence_of :from, :email, :subject, :description
  
end
