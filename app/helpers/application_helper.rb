module ApplicationHelper

  def title
    @basetitle = "Restaurant Prototype"
    if @title.nil?
      @basetitle
    else
      "#{@basetitle} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Restaurant Icon", :class => "round")
  end

end
