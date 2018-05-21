module ApplicationHelper
  def full_title page_title = ""
    base_title = t "myShop"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_order
  	if !session[:order_id].nil?
  	  Order.find_by id: params[session[:order_id]]
  	else
  	  Order.new
  	end
  end
end
