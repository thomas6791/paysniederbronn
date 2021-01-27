class RentingsController < ApplicationController
  before_action :set_seo
  before_action :set_data, only: [:show, :edit, :update, :destroy]
  def index
    #@annonces = Renting.all.where(category:"renting")
    @annonces = Renting.all
    @flats = @annonces.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show

    if !@annonce.airbnb.blank? && @annonce.booking.blank?
      #@dates_renting = helpers.airbnb_dates(@annonce.airbnb)
    elsif !@annonce.booking.blank? && @annonce.airbnb.blank?
      #@dates_renting = helpers.booking_dates(@annonce.booking)
    elsif !@annonce.booking.blank? && !@annonce.airbnb.blank? # priorité au calendrier Airbnb
      #@dates_renting = helpers.airbnb_dates(@annonce.airbnb)
    else
      @dates_renting = []
    end

  end

  def new
    @annonce  = Renting.new
  end

  def create
    @annonce  = Renting.new(renting_params)
    @annonce.user_id = 1
    @annonce.save
    helpers.geocode_cure(@annonce)
  end

  def edit
    @annonce = Renting.find(params[:id])
  end

  def update
    @annonce = Renting.find(params[:id])
    @annonce.update(renting_params)
    helpers.geocode_cure(@annonce)
    redirect_to renting_path(@annonce)
  end

  def destroy
    @annonce = Renting.find(params[:id])
  end

  def remove_photo
    @annonce = Renting.find(params[:annonce])
    @annonce.photos.find(params[:photo]).purge
    redirect_to edit_renting_path(@annonce,anchor: "photos")
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

  def contact_send
    annonce = Renting.find(params[:contact][:renting_id].to_i)
    start = params[:contact][:start]
    end_rent = params[:contact][:end]
    if params[:contact][:rgpd] == "0"
      redirect_back fallback_location: root_path
      #redirect_to contact_rentings_path(params[:contact][:start] => start, params[:contact][:end] => end_rent)
      #param_1: 'value_1', param_2: 'value_2'
    else
      annonce_email = annonce.email
      RentingMailer.with(annonce_email: annonce_email).rentingask.deliver_now
    end
  end

  def chasse
    @annonces = Renting.all.where(category:"renting")
    @flats = @annonces.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def select
    if params[:rent] == "capacite"
      @annonces = Renting.all.where("capacity >= ?", 10) && Renting.joins(:renting_categories).where('renting_categories.name' => "grande capacité")
    elsif params[:rent] == "cure thermale"
      @annonces = Renting.joins(:renting_categories).where('renting_categories.name' => "cure thermale")
    elsif params[:rent] == "familles"
      @annonces = Renting.joins(:renting_categories).where('renting_categories.name' => "famille")
    elsif params[:rent] == "animaux"
      @annonces = Renting.joins(:renting_categories).where('renting_categories.name' => "accepte les animaux")
    elsif params[:rent] == "chasseur"
      @annonces = Renting.joins(:renting_categories).where('renting_categories.name' => "chasseurs")
    elsif params[:rent] == "all"
      @annonces = Renting.all
    else
      @annonces = Renting.all
    end
    #render js: "alert('The number is: bonjour')"
    #render js: { render: 'select.js.erb' }
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

  def renting_params
    params.require(:renting).permit(:titre, :description, :summary, :city, :zip_code, :address, :latitude, :longitude, :website, :email, :tel, :category, :airbnb, :booking, :price_day, :price_week, photos: [], renting_category_ids: [])
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_data
    @annonce = Renting.find(params[:id])
  end
end
