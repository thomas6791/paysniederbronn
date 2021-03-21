class CartItemsController < ApplicationController
  def index
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    #cookies[:cart_user] = { :value => 123, :expires => Time.now + 1.hour, :cart =>{}}
    session[:cart_user] = {
      test: "XJ-122",
      xcv: "dfg",
      expires: 1.hour.from_now
    }
    #cookies[:user] = { :value => "XJ12", :expires => Time.now + 3600}
    @cart_item = CartItem.new(cart_item_params)
    # we need `restaurant_id` to associate cart_item with corresponding restaurant
    @commerce = Commerce.find(params[:commerce_id])
    @product = @commerce.products.find(params[:product_id])
    @cart_item.product = @product
    @cart_item.save
    fail
    redirect_to commerce_path(@commerce)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id, :commerce_id)
  end
end
