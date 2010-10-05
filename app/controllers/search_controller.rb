class SearchController < ApplicationController

  def index
    @query = params[:q]  
    page = params[:page]
    @polls = Poll.search(@query, page)  
  end
end
