class HomeController < ApplicationController
  
  def index
    @category = params['category']
    page = params[:page]
    per_page = 2
    @polls = @category.nil? ? Poll.fetch_recent(page, per_page) : Poll.fetch_all_active(@category, page, per_page)
  end
  
  def aboutus
    @title = "About Us"
  end
  
  def privacypolicy
    @title = "Privacy Policy"
  end

end
