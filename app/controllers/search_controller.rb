class SearchController < ApplicationController

  def index
    @query = params[:q] 
    @category = params[:category]
    page = params[:page]
    @polls = Poll.search(@query, @category, page)  
  end
end
