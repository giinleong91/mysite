class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to @product
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update!(product_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to root_path
  end
  
  def search
    @product = Product.search_name(params[:search])
				respond_to do |format|
					format.json {	render json: @product }
					format.html { render "products/search"}
					format.js 
        end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :product_id, :price, :category, :stock_number, :description)
  end
end
