class DiscussionsController < ApplicationController

  def new
    poll_uniqueid = params[:poll_unique_id]
    @poll = Poll.find_by_uniqueid(poll_uniqueid)
    @poll.discussions.create(:text => params[:text], :user_id => current_user.id)
    redirect_to external_path(poll_uniqueid) 
  end
  
  def like
    discussion_id = params[:discussionid]
    @discussion = Discussion.find(discussion_id)
    @discussion.like!
    respond_to do |format|
      format.js { return @discussion.likes }
    end
  end
  
  def dislike
    discussion_id = params[:discussionid]
    @discussion = Discussion.find(discussion_id)
    @discussion.dislike!
    respond_to do |format|
      format.js { return @discussion.dislikes }
    end
  end
  
end
