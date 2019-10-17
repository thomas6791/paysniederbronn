class HolidayRentingsController < ApplicationController
  before_action :set_seo
  def index
    @annonces = HolidayRenting.all
  end

  def show
    @annonce = HolidayRenting.find(params[:id])
    if @annonce.id == 1
      redirect_to action: "meuble_heidelbeere"
    end
  end

  def new
    @annonce  = HolidayRenting.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def gites_heidelbeere
    require 'yaml'
    if locale == :fr
      @cards = YAML.load(File.read("config/cards.yml"))[:heidelbeere][locale.to_s]
      render 'holiday_rentings/gites-heidelbeere/gites-heidelbeere'
    elsif
      @cards = YAML.load(File.read("config/cards.yml"))[:heidelbeere][locale.to_s]
      render 'holiday_rentings/en.gites_heidelbeere'
    else
    end
    @bonjour = "Hello"
  end

  def meuble_heidelbeere
    render "holiday_rentings/gites-heidelbeere/#{locale.to_s}.meuble-heidelbeere"
  end

  private

  def renting_params
    params.require(:holiday_renting).permit(:name, :description, :city, :zip_code, :address, :latitude, :longitude, :website)
  end

  def set_seo
    set_meta_tags noindex: true
  end
end
