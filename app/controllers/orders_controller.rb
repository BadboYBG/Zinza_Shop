class OrdersController < ApplicationController
  before_action :check_login

	def create
    @order = Order.new params_order
    @order.date_order = Time.now
    if @order.save
      create_order_items
      session.delete :order_items
      redirect_to root_url
      flash[:success] = "Buy success!"
    else
       flash[:danger] = "No product or can't blank address, date delivery"
      redirect_to carts_path
    end
  end

  private
  def params_order
    params.require(:order).permit :address, :date_delivery, :total, :user_id
  end
  def create_order_items
    session[:order_items].each do |key, val|
      product_id = key.to_i
      number = val.to_i
      order_id = @order.id
      OrderItem.create(number: number, order_id: order_id, product_id: product_id)
    end
  end

  def check_login
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
