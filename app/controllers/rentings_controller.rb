class RentingsController < ApplicationController
  before_action :set_seo
  before_action :set_data, only: [:show, :edit, :update, :destroy]
  def index
    @annonces = Renting.all.where(category:"renting")
  end

  def show
    @dates_renting = helpers.airbnb_dates(@annonce.airbnb) if !@annonce.airbnb.blank?
    #set_meta_tags nofollow: true, noindex: true
  end

  def new
    @annonce  = Renting.new
  end

  def create
    @annonce  = Renting.new(renting_params)
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
      render 'rentings/gites-heidelbeere/gites-heidelbeere'
    elsif
      @cards = YAML.load(File.read("config/cards.yml"))[:heidelbeere][locale.to_s]
      render 'rentings/en.gites_heidelbeere'
    else
    end
    @bonjour = "Hello"
  end

  def meuble_heidelbeere
    render "rentings/gites-heidelbeere/#{locale.to_s}.meuble-heidelbeere"
  end

  def contact
  end

  private

  def renting_params
    params.require(:renting).permit(:titre, :description, :summary, :city, :zip_code, :address, :latitude, :longitude, :website, :email, :tel, :category, :airbnb, :booking, photos: [])
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_data
    @annonce = Renting.find(params[:id])
  end
end
