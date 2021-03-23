class OrdersController < ApplicationController
  def new
  end

  def create
    @cart = session[:cart][params[:commerce_id]]
    fail
    #teddy = Teddy.find(params[:teddy_id])
    #order  = Order.create!(teddy: teddy, teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)


    #redirect_to new_order_payment_path(order)
  end
end
