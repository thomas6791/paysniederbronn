class CommercesController < ApplicationController
  def index
    @commerces = Commerce.all
  end

  def show
    @commerce = Commerce.find(params[:id])
    @products = @commerce.products
    #@order = Order.new
    @cart_item = CartItem.new
  end

  def new
    @commerce = Commerce.new
  end

  def create
    @commerce = Commerce.new(commerce_params)
    @commerce.user = current_user if current_user.present?
    @commerce.save

    redirect_to commerce_path(@commerce)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def commerce_params
    params.require(:commerce).permit(:name, :address)
  end
end
