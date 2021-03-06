class CartItemsController < ApplicationController
  #before_action :set_cart
  def index
  end

  def new
    @cart_item = CartItem.new
    @cart = session[:cart][@commerce.slug]
  end

  def create
    #cookies[:cart_user] = { :value => 123, :expires => Time.now + 1.hour, :cart =>{}}
    #cookies[:user] = { :value => "XJ12", :expires => Time.now + 3600}
    @cart_item = CartItem.new(cart_item_params)
    # we need `restaurant_id` to associate cart_item with corresponding restaurant
    @commerce = Commerce.friendly.find(params[:commerce_id])
    @product = @commerce.products.find(params[:product_id])
    @cart_item.product = @product
    y = session[:cart][@commerce.slug].find {|x| x["name"] == @cart_item.product.name}
    y["quantity"] = @cart_item.quantity
    y["sub_total"] = Money.new(@cart_item.product.price * @cart_item.quantity)
    #fail
    #y["sub_total"] = Money.new(y["sub_total"]["cents"])
    #@cart_item.save
    #fail
    #fail
    @cart = session[:cart][@commerce.slug]
    respond_to do |f|
      f.html { redirect_to @commerce }
      f.js
    end
    #session[:cart][@commerce.id.to_s][@product.id.to_s] ={}
    #session[:cart][@commerce.id.to_s][@product.id.to_s].merge!(key: "bar")
    #redirect_to commerce_path(@commerce)

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

  def set_cart
    session[:cart][params[:commerce_id]] = {}
  end

  def view_cart
    @commerce = Commerce.friendly.find(params[:commerce_id])
    @product = @commerce.products.find(params[:product_id])
    @cart = session[:cart][@commerce.slug]
    item = @cart.find {|x| x["name"] == @product.name}
    if params[:action_link].present? && params[:action_link] == "minus"
      item["quantity"] -=1
      @action = "minus"
    elsif params[:action_link].present? && params[:action_link] == "plus"
      item["quantity"] +=1
      @action = "plus"
    else
      item["quantity"] = params[:cart_item][:quantity].to_i
      @action = "none"
    end
    x = @product.price * item["quantity"]
    item["sub_total"]["cents"] = x.fractional
    @subtotal = 0
    @cart.each do |item|
      @subtotal += item["sub_total"]["cents"]
    end
    @subtotal = Money.new(@subtotal)
    #item["sub_total"] = @product.price_cents * item["quantity"]

    #redirect_to commerce_path(@commerce)
    respond_to do |f|
      f.html { redirect_to commerce_path(@commerce) }
      f.js
    end
  end

  def add_to_cart
    @commerce = Commerce.friendly.find(params[:commerce_id])
    commerce_items = session[:cart][params[:commerce_id]]
    remove_item = session[:cart][params[:commerce_id]].find {|x| x["name"] == params["name"]}
    #remove_item = session[:cart][params[:commerce_id]].find {|x| x["name"] == Product.find(params[:product_id]).name}
    remove_item["quantity"] +=1
    @commerce.products.find_by(name:remove_item["name"]).price
    remove_item["sub_total"]["cents"] += @commerce.products.find_by(name:remove_item["name"]).price.cents
    #remove_item["sub_total"]["cents"] = 0
    redirect_to commerce_path(@commerce)
  end

  def remove_to_cart
    @commerce = Commerce.friendly.find(params[:commerce_id])
    commerce_items = session[:cart][params[:commerce_id]]
    remove_item = session[:cart][params[:commerce_id]].find {|x| x["name"] == params["name"]}
    #remove_item = session[:cart][params[:commerce_id]].find {|x| x["name"] == Product.find(params[:product_id]).name}
    remove_item["quantity"] -=1
    @commerce.products.find_by(name:remove_item["name"]).price
    remove_item["sub_total"]["cents"] -= @commerce.products.find_by(name:remove_item["name"]).price.cents
    #remove_item["sub_total"]["cents"] = 0
    redirect_to commerce_path(@commerce)
  end

end
