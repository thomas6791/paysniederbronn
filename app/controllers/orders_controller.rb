class OrdersController < ApplicationController
  def new
    #@order = Order.new
  end

  def create
    @cart = session[:cart][params[:commerce_id]]
    commerce =  Commerce.find(params[:commerce_id])
    #teddy = Teddy.find(params[:teddy_id])
    #order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)
    @order = Order.new
    order_arr = []
    @cart.each do |item|
      order_arr << item if item["sub_total"]["cents"] != 0
    end
    amount = 0
    order_arr.each do |item|
      x = CartItem.new
      x.product_id = commerce.products.find_by(name: item["name"]).id
      x.quantity = item["quantity"]
      x.subtotal_cents = item["sub_total"]["cents"]
      amount += item["sub_total"]["cents"]
      x.save!
      @order.cart_items << x
    end
    @order.amount_cents = amount
    @order.delivery_date = params[:order][:delivery_date]

    @order.save!
    if @order.save?
      session[:cart][params[:commerce_id]] = []
    else
    end

    #redirect_to new_order_payment_path(order)
  end
end
