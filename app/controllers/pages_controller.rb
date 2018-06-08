class PagesController < ApplicationController
  def index
    @products_new = Product.list_product.check_number_product.order(updated_at: :desc).limit(Settings.show_limit.show_6)
    @products = Product.list_product.check_number_product.order(view: :desc).limit(Settings.show_limit.show_6)
  end

  def contact; end
end
