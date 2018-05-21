class CategoriesController < ApplicationController
  before_action :category_params

  def show
  	@products = Product.list_product_of_category(@category.id).page(params[:page]).per 6
  end

  private

  def category_params
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = "Not found"
      redirect_to root_url
  	end
  end
end
