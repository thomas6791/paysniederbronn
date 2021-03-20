class CartItemsController < ApplicationController
  def index
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # we need `restaurant_id` to associate cart_item with corresponding restaurant
    @commerce = Commerce.find(params[:commerce_id])
    @cart_item.save
    redirect_to commerce_path(@commerce)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
