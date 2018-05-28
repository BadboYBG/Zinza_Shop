module CartsHelper
  def add_carts(id_product)
    session[:order_items][id_product] ||= 0
    # update số lượng nếu người dùng bấm 2 lần thêm giỏ hàng cùng 1 sản phẩm
    session[:order_items].each do |t, val|
      if t == id_product
        val += 1
        session[:order_items][t] = val
      end
    end
    session[:time][id_product] = Time.zone.now
  end

  def product_in_carts
    products_cart = []
    session[:order_items].each_key do |id|
      unless id.nil?
        product = Product.find_by id: id
        session[:order_items].delete id if product.nil?
        products_cart.push(product)
      end
      next if id.nil?
    end
    products_cart
  end

  def subtotal
    total ||= 0
    if !product_in_carts.nil?
      product_in_carts.each do |t|
        total += t.price * session[:order_items][t.id.to_s].to_i unless t.nil?
        next if t.nil?
      end
    else
      total = 0
    end
    total
  end

  def total_price_product(number, price)
    number * price
  end

  def many_carts
    session[:order_items].length
  end

  def destroy_carts(id)
    session[:order_items].delete id
  end
end
