class ContactusController < ApplicationController
  
  def new
    @contactus = Contactus.new
  end
  
  def create
    @contactus = Contactus.new(params[:contactus])
    if(@contactus.save)
      flash[:message] = 'Thank You for contacting us. We will respond to you soon.'
      redirect_to :action => :contactus_response
    else
      render :action => :new
    end
  end
  
  def show
    redirect_to :action => :new
  end
  
  def contactus_response
  end
  
end
