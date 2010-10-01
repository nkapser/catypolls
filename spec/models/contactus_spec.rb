require File.dirname(__FILE__) + '/../spec_helper'

describe Contactus do
  it "should vaidate contactus fields" do
    contactus = Contactus.new
    contactus.save
    
    contactus.errors.count.should == 4
    contactus.errors[:from].should == "can't be blank"
  end
end