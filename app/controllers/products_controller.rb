class ProductsController < ApplicationController
  before_action :read_product, only: %i[show edit destroy]
  before_action :check_login, except: %i[show index]

  def index
    @search = Product.list_product.check_number_product.order(price: :desc).ransack params[:search]
    @products = @search.result.page(params[:page]).per params[:limit]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = 'Add product success!'
      redirect_to @product
    else
      flash[:danger] = 'Error add product'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    return render :show if @product.update_attributes product_params
    flash[:danger] = "Loi"
    render :edit
  end

  def destroy
    @product.destroy
    flash[:success] ="Xoa Thanh Cong"
    render :mylist
  end

  def search
    @q = Product.ransack params[:search]
    @ps = @q.result.page(params[:page]).per 6
  end

  def mylist
    @products = current_user.products.page(params[:page]).per 10
  end

  private

  def product_params
    params.require(:product).permit :name, :price, :sale, :number, :detail, :image, :category_id, :user_id
  end

  def read_product
    @product = Product.find_by id: params[:id]
    return unless @product.nil?
    flash[:danger] = 'Not found'
    redirect_to root_path
  end
end
