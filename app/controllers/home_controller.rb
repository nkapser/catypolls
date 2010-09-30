class HomeController < ApplicationController
  
  def index
    @category = params['category'] || 'General'
    @polls = Poll.fetch_all_active(@category)
  end
  
  def aboutus
  end

end
