class PagesController < ApplicationController
  def index
    @products = Product.list_product.check_number_product.order(price: :desc)
    .page(params[:page]).per params[:limit]
  end

  def contact
  end
  
end
