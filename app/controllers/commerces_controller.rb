class CommercesController < ApplicationController
  before_action :cart, only: [:show]
  def index
    @commerces = Commerce.all
  end

  def show
    session.delete(cart)
    @commerce = Commerce.find(params[:id])
    @products = @commerce.products
    #@order = Order.new
    @cart_item = CartItem.new
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
  end

  def update
  end

  def destroy
  end

  def commerce_params
    params.require(:commerce).permit(:name, :address)
  end

  def cart
    session[:cart] ||= {}
    #session[:cart][@commerce.id.to_s] = {}
    if session[:cart][params[:id]].nil? || session[:cart][params[:id]].empty? || session[:cart][params[:id]].size != Commerce.find(params[:id]).products.size
      session[:cart][params[:id]]= {}
      arr = []
      keys = ["name", "quantity", "sub_total"]
      Commerce.find(params[:id]).products.each do |pdt|
        values = [pdt[:name], 0, 0.00]
        x = [keys, values].transpose.to_h
        arr << x
      end
      session[:cart][params[:id]] = arr
    end
    #session[:cart] = session[:cart].inject(:merge)
  end
end
