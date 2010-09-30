class HomeController < ApplicationController
  
  def index
    @category = params['category'] || 'General'
    
    # @polls = Poll.fetch_all_active(@category)
    page = params[:page]
    @polls = Poll.fetch_all_active(@category, page)
  end
  
  def aboutus
  end

end
