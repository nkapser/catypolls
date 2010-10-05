class HomeController < ApplicationController
  
  def index
    @category = params['category'] || 'General'
    page = params[:page]
    per_page = 2
    @polls = Poll.fetch_all_active(@category, page, per_page)
  end
  
  def aboutus
    @title = "About Us"
  end

end
