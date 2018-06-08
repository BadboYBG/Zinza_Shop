class OrdersController < ApplicationController
  before_action :check_login

  def create
    @order = Order.new params_order
    @order.create_order_items(session[:order_items], current_user)
    if @order.save 
      session.delete :order_items
      redirect_to root_url
      flash[:success] = t('flashs.buy_success')
    else
      flash[:danger] = t('flashs.error_check_out')
      redirect_to carts_path
    end
  end

  def show
    @orders = current_user.orders.page(params[:page]).per Settings.show_limit.show_6
  end

  private

  def params_order
    params.require(:order).permit :address, :date_delivery, :total, :user_id
  end
end
