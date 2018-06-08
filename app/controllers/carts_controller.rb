class CartsController < ApplicationController
  def index
    @order_cart = session[:order_items]
    @order = Order.new
  end

  def create
    @id_product = params[:session][:product_id]
    return flash[:danger] = 'Error Cart' if @id_product.blank?
    add_carts @id_product
    flash[:success] = t('flashs.add_cart_success')
  end

  def update
    id = params[:item][:id_product]
    session[:order_items][id] = params[:item][:quantily].to_i
    flash[:success] = t('flashs.update_success')
  end

  def destroy
    id = params[:id]
    return if id.nil?
    destroy_carts params[:id]
    flash[:success] = t('flashs.delete_success')
  end
end
