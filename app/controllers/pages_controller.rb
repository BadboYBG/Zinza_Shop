class PagesController < ApplicationController
	before_action :check_login, only: %i(show)
  def index
  	@search = Product.list_product.check_number_product.order(price: :desc).ransack params[:q]
    @products = @search.result.page(params[:page]).per params[:limit]
  end

  def contact
  end
  def show
  	@user = current_user
  	@orders = @user.orders.page(params[:page]).per 6
  end
end
