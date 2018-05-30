class CategoriesController < ApplicationController
  before_action :category_params
  def index; end
  def show
    @products = @category.products.page(params[:page]).per 6
  end

  private

  def category_params
    @category = Category.find_by id: params[:id]
    return unless @category.nil?
    flash[:danger] = 'Not found'
    redirect_to root_url
  end
end
