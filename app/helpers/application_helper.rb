# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def top_categories
    ['general', 'sports', 'movies', 'politics', 'business', 'books', 'fashion', 'news' ]
  end
  
  def category_collection
    ["<option>all</option>"] << top_categories.map {|category| "<option>#{category}</option>"}
  end
  
  def category_links
    links = top_categories.map do |category|
      link_to(category.capitalize, category_polls_path(category))
    end
    links.join(' | ')
  end
  
  def get_total_votes(poll)
  	options = poll.options
  	totalVotes = 0
  	options.each do |option|
   		totalVotes = totalVotes + option.counter			
  	end
  	totalVotes
  end
end
