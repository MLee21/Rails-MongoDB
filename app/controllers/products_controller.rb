class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = @product.errors.full_messages.join(", ")
      redirect_to products_path
    else
      flash[:error] = @product.errors.full_message.join(", ")
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
