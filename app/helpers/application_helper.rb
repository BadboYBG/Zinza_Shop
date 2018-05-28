module ApplicationHelper
  def full_title(page_title = '')
    base_title = t 'myShop'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find_by id: params[session[:order_id]]
    else
      Order.new
    end
  end

  def create_index(params_page, index, per_page)
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end
end
