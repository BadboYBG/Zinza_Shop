class OrdersController < ApplicationController
  before_action :check_login

  def create
    @order = Order.new params_order
    # @order.date_order = Time.now
    if @order.save
      create_order_items
      session.delete :order_items
      redirect_to root_url
      flash[:success] = 'Buy success!'
    else
      flash[:danger] = 'No product or can\'t blank address, date delivery'
      redirect_to carts_path
    end
  end

  def show
    @user = current_user
    @orders = @user.orders.page(params[:page]).per 6
  end

  private

  def params_order
    params.require(:order).permit :address, :date_delivery, :total, :user_id
  end

  def create_order_items
    session[:order_items].each do |key, val|
      product_id = key.to_i
      number = val.to_i
      price = Product.find_by(id: product_id).price
      order_id = @order.id
      OrderItem.create(number: number, price: price, order_id: order_id, product_id: product_id)
    end
  end
end
