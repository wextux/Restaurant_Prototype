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
  
  def active_page(active_page)
    if current_page?(active_page)
      return "active"
    else
      return nil
    end
  end

end
