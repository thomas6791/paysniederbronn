class HolidayRentingsController < ApplicationController
  before_action :set_seo
  before_action :set_data, only: [:show, :edit, :update, :destroy]
  def index
    #@annonces = HolidayRenting.all.where(category: "renting")
  end

  def show
  end

  def new
    #@annonce  = HolidayRenting.new
  end

  def create
    #@annonce  = HolidayRenting.new(renting_params)
    #@annonce.save
  end

  def edit
  end

  def update
    #@annonce.update(renting_params)
  end

  def destroy
  end

  private

  def renting_params
    params.require(:holiday_renting).permit(:titre, :description, :summary, :city, :zip_code, :address, :latitude, :longitude, :website, :email, :tel, :category, :airbnb, :booking, photos: [])
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_data
    @annonce = HolidayRenting.find(params[:id])
  end
end
