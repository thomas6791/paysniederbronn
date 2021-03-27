class OrdersController < ApplicationController
  def new
    #@order = Order.new
  end

  def create
    @cart = session[:cart][params[:commerce_id]]
    commerce =  Commerce.find(params[:commerce_id])
    #teddy = Teddy.find(params[:teddy_id])
    #order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)
    @order = Order.create!
    @order.commerce_id = commerce.id
    order_arr = []
    @cart.each do |item|
      order_arr << item if item["sub_total"]["cents"] != 0
    end
    order_arr.each do |item|
      x = CartItem.new
      x.product_id = commerce.products.find_by(name: item["name"]).id
      x.quantity = item["quantity"]
      x.subtotal_cents = item["sub_total"]["cents"]
      @order.cart_items << x
      x.save!
      @order.save!
    end
    @order.cart_items.each do |item|
      @order.amount_cents += item.subtotal_cents
    end
    @order.delivery_date = params[:order][:delivery_date]
    @order.rgpd = true if params[:order][:rgpd] == "1"
    @order.email = params[:order][:email]
    @order.tel = params[:order][:tel]
    @order.last_name = params[:order][:last_name]
    @order.first_name = params[:order][:first_name]
    @order.save!
    session[:cart][params[:commerce_id]] = []
    flash[:notice] = "Votre commande a été envoyée"
    redirect_to commerce_path(commerce)
  end
end
