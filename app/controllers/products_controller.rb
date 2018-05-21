class ProductsController < ApplicationController
  before_action :product_params, only: %i(show)

  def index
    @search = Product.list_product.check_number_product.order(price: :desc).ransack params[:q]
    @products = @search.result.page(params[:page]).per params[:limit]
  end

  def show; end

  def search
    @q = Product.ransack params[:search]
    @ps = @q.result.page params[:page]
  end

  private

  def product_params
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = "Nou found"
      redirect_to root_path	
    end
  end
  
end
