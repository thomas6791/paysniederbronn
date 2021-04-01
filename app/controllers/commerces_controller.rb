class CommercesController < ApplicationController
  before_action :cart, only: [:show]
  def index
    @commerces = Commerce.all
  end

  def show
    session.delete(cart)
    @commerce = Commerce.friendly.find(params[:id])
    @products = @commerce.products
    #@order = Order.new
    @cart_item = CartItem.new
    @order = Order.new
    @subtotal = 0
    session[:cart][@commerce.id.to_s].each do |item|
      @subtotal += item["sub_total"]["cents"]
    end
    @subtotal = Money.new(@subtotal)
    #session[:cart]["1"].find {|x| x["name"] == "gâteau à la cannelle"}
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
    @commerce = Commerce.friendly.find(params[:id])
  end

  def update
    @commerce = Commerce.friendly.find(params[:id])
    @commerce.update(commerce_params)
  end

  def destroy
  end

  def commerce_params
    params.require(:commerce).permit(:name, :address)
  end

  def cart
    session[:cart] ||= {}
    #session[:cart][@commerce.id.to_s] = {}
    if session[:cart][params[:id]].nil? || session[:cart][params[:id]].empty? || session[:cart][params[:id]].size != Commerce.friendly.find(params[:id]).products.size
      session[:cart][params[:id]]= {}
      arr = []
      keys = ["name", "quantity", "sub_total"]
      Commerce.friendly.find(params[:id]).products.each do |pdt|
        values = [pdt[:name], 0, 0.00]
        x = [keys, values].transpose.to_h
        arr << x
      end
      session[:cart][params[:id]] = arr
      session[:cart][params[:id]].each do |item|
        item["sub_total"] = {"cents"=>0, "currency_iso"=>"EUR"}
      end
    end
    #session[:cart] = session[:cart].inject(:merge)
  end
end
