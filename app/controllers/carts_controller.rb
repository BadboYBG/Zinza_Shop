class CartsController < ApplicationController

  def index
    @order_cart = session[:order_items]
    @order = Order.new
  end

  def create
  	@id_product = params[:session][:product_id]
    if !@id_product.blank?
  		add_carts @id_product
      flash[:success] = "add cart success"
  	else
  		flash[:danger] = "Error Cart"
  	end
  end

  def update
    id = params[:item][:id_product]
    session[:order_items][id] = params[:item][:quantily].to_i
    flash[:success] = "Update success"
  end

  def destroy
    id = params[:id]
    if !id.nil?
      destroy_carts params[:id]
      flash[:success] = "Delete success"
    end
  end
end
