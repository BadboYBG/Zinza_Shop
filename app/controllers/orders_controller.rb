class OrdersController < ApplicationController
  before_action :check_login

  def create
    @order = Order.new params_order
    if @order.save
      @order.order_items.build
      create_order_items
      redirect_to root_url
      flash[:success] = 'Buy success!'
    else
      flash[:danger] = 'No product or can\'t blank address, date delivery'
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

  def create_order_items
    # TODO: viet lai de ko query trong vong lap
    # TODO: viet lai phan tao OrderItem, ko dung truc tiep Model nua ma tao du lieu thong qua @order object
    # Viet method tao orderItem vao trong Order Model
    # @order.buildOrderItem()
    # @order.save

    session[:order_items].each do |key, val|
      product_id = key.to_i
      number = val.to_i
      price = Product.find_by(id: product_id).price
      OrderItem.create(number: number, price: price, product_id: product_id)
    end
  end
end
