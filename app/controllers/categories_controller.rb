class CategoriesController < ApplicationController

  def index
    @category = params['category'] || 'General'
    page = params[:page]
    per_page = 5
    @polls = Poll.fetch_all_active(@category, page, per_page)
  end
  
end
