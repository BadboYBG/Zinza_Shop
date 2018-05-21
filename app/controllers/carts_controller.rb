class CartsController < ApplicationController

  def index
    @order_cart = session[:order_items]
    @order = Order.new
  end

  def create
  	@id_product = params[:session][:product_id]
  	if !@id_product.nil?
  		add_carts @id_product
  	else
  		flash[:danger] = "Error Cart"
  	end
  end

  def update
    id = params[:item][:id_product]
    session[:order_items][id] = params[:item][:quantily].to_i
  end

  def destroy
    if !params[:id].nil?
      destroy_carts params[:id]
    else
      flash[:danger] = "Delete fail!"
    end
  end
end
