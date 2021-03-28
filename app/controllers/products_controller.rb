class ProductsController < ApplicationController
  def new
    @commerce = Commerce.find(params[:commerce_id])
    @product = Product.new
    @product.availability = {:lundi=>false, :mardi=>false, :mercredi=>false, :jeudi=>false, :vendredi=>:false, :samedi=>false, :dimanche=>false}
  end

  def create
    @product = Product.new(product_params)
    # we need `commerce_id` to associate product with corresponding commerce
    @commerce = Commerce.find(params[:commerce_id])
    @product.availability = {:lundi=>false, :mardi=>false, :mercredi=>false, :jeudi=>false, :vendredi=>:false, :samedi=>false, :dimanche=>false}
    params[:product][:availability].shift
    params[:product][:availability].each do |day|
      @product.availability[day.downcase] = true
    end
    @product.commerce = @commerce
    @product.save
    redirect_to commerce_path(@commerce)
  end

  def edit
    @commerce = Commerce.find(params[:commerce_id])
    @product = Product.find(params[:id])
  end

  def update
    @commerce = Commerce.find(params[:commerce_id])
    @product =  @commerce.products.find(params[:id])
    @product.update(product_params)
    @product.availability = {:lundi=>false, :mardi=>false, :mercredi=>false, :jeudi=>false, :vendredi=>:false, :samedi=>false, :dimanche=>false}
    params[:product][:availability].shift
    params[:product][:availability].each do |day|
      @product.availability[day.downcase] = true
    end
    redirect_to commerce_path(@commerce)
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :photo, :availability)
  end
end
