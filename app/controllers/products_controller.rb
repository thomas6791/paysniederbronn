class ProductsController < ApplicationController
  def new
    @commerce = Commerce.find(params[:commerce_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # we need `commerce_id` to associate product with corresponding commerce
    @commerce = Commerce.find(params[:commerce_id])
    @product.commerce = @commerce
    @product.save
    redirect_to commerce_path(@commerce)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :photo)
  end
end
