class PollsController < ApplicationController

  before_filter :require_user, :except => [:view, :vote]
  
  helper_method :pc_read

  def index
    @polls = Poll.find(:all, :order => 'updated_at DESC', :conditions => ["user_id = ?", current_user_session.user.id])
  end
  
  def new
    @poll = Poll.new
    2.times { @poll.options.build }
  end
  
  def create
    @poll = Poll.new(params[:poll])
    @poll.user = current_user_session.user
    if(@poll.save)
      redirect_to :action => :index
    else
      flash[:error] = "Couln't create the record!"
      render :action => :new
    end
  end
  
  def update
    @poll = Poll.find(params[:id])
    if(!@poll.nil?)
      @poll.update_attributes!(params[:poll])
      redirect_to :action => :show
    end
  rescue Exception => e
        render :action => :edit
  end
  
  def edit
    @poll = Poll.find(params[:id])
  end
  
  def show
    @poll = Poll.find(params[:id])
  end
  
  def publish
    @poll = Poll.find(params[:id])
    @poll.publish!
  end
  
  def view    
    @poll = Poll.find_by_uniqueid(params[:uniqueid])
    if(!pc_read.include?(@poll.id.to_s))
      @poll.increment_views!
    end
    @discussions = @poll.discussions_by_latest(params[:page])
    @title = "#{@poll.category.name} - #{@poll.question}"
  end
  
  def vote
    @poll = Poll.find_by_uniqueid(params[:uniqueid])
    @poll.update_vote(params[:option])
    pc_write(@poll.id)
    flash[:message] = "You have voted succesfully"
    redirect_to :action => :view, :uniqueid => params[:uniqueid], :category => @poll.category.name, :name => @poll.name
  end  
  
  def result
    @poll = Poll.find_by_uniqueid(params[:uniqueid])
    @discussions = @poll.discussions_by_latest(params[:page])
    @title = "#{@poll.category.name} - #{@poll.question} - Result"    
  end
  
  private
  
  def pc_write(id)
    if cookies[:_pckies].blank?
      cookies[:_pckies] = id
    else
      cookies[:_pckies] = cookies[:_pckies] << ",#{id}"
    end
  end

  def pc_read
    cookies[:_pckies] ? cookies[:_pckies].split(",") : []
  end
end
