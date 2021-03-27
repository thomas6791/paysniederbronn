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

    @order.amount_cents = amount
    @order.delivery_date = params[:order][:delivery_date]

    @order.save!
    session[:cart][params[:commerce_id]] = []

    redirect_to commerce_path(commerce), notice: "Votre commande a été envoyée"
  end
end
