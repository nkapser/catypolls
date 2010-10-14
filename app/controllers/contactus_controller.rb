class ContactusController < ApplicationController
    
  def new
    @title = "ContactUs"    
    @contactus = Contactus.new
  end
  
  def create
    @contactus = Contactus.new(params[:contactus])
    if(verify_recaptcha(:model => @contactus, :message => "Oh! It's error with reCAPTCHA!") && @contactus.save)
      flash[:message] = 'Thank You for contacting us. We will respond to you soon.'
      redirect_to :action => :contactus_response
    else
      render :action => :new
    end
  end
  
  def show
    @title = "ContactUs - Response"
    redirect_to :action => :new
  end
  
  def contactus_response
  end
  
end
