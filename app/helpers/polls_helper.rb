module PollsHelper

  def categories
    @categories ||= Category.find(:all).collect{|c| [c.name, c.id]}
  end
  
end
