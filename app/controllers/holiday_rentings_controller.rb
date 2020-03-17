class HolidayRentingsController < ApplicationController
  before_action :set_seo
  before_action :set_data, except: [:index]
  def index
    @annonces = HolidayRenting.all
  end

  def show
  end

  def new
    @annonce  = HolidayRenting.new
  end

  def create
    @annonce  = HolidayRenting.new(renting_params)
    @annonce.save
  end

  def edit
  end

  def update
    @annonce.update(renting_params)
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
    params.require(:holiday_renting).permit(:titre, :description, :summary, :city, :zip_code, :address, :latitude, :longitude, :website)
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_data
    @annonce = HolidayRenting.find(params[:id])
  end
end
