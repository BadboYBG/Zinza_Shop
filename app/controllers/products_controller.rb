class ProductsController < ApplicationController
  before_action :read_product, only: %i[show edit destroy update]
  before_action :check_login, except: %i[show index search]

  def index
    @search = Product.all.ransack params[:q]
    @products = @search.result.list_product.check_number_product.order(created: :desc).page(params[:page]).per params[:limit]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t('flashs.add_product_success')
      redirect_to @product
    else
      flash[:danger] = t('flashs.error_add_product')
      render :new
    end
  end

  def show; end

  def edit
    return redirect_to root_path unless current_user.id == @product.user_id
  end

  def update
    return render :show if @product.update_attributes product_params
    flash[:danger] = t('flashs.error_update')
    render :edit
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      flash[:success] = t('flashs.delete_success')
      render :mylist
    else
      redirect_to root_path
    end 
  end

  def search
    @q = Product.ransack params[:search]
    @ps = @q.result.page(params[:page]).per Settings.show_limit.show_6
  end

  def mylist
    @products = current_user.products.page(params[:page]).per Settings.show_limit.show_12
  end

  private

  def product_params
    params.require(:product).permit :name, :price, :sale, :number, :detail, :image, :category_id, :user_id
  end

  def read_product
    @product = Product.find_by id: params[:id]
    return unless @product.nil?
    flash[:danger] = t('flash.not_found')
    redirect_to root_path
  end
end
