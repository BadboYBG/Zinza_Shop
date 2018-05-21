class PagesController < ApplicationController
  def index
  	@search = Product.list_product.check_number_product.order(price: :desc).ransack params[:q]
    @products = @search.result.page(params[:page]).per params[:limit]
  end

  def contact
  end
  def show
  	
  end
end
