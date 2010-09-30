class DiscussionsController < ApplicationController

  def new
    poll_uniqueid = params[:poll_unique_id]
    @poll = Poll.find_by_uniqueid(poll_uniqueid)
    @poll.discussions.create(:text => params[:text], :user_id => current_user.id)
    redirect_to external_path(poll_uniqueid) 
  end
  
end
