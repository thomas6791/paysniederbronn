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
      @dates_renting = helpers.airbnb_dates(@annonce.airbnb)
    elsif !@annonce.booking.blank? && @annonce.airbnb.blank?
      @dates_renting = helpers.booking_dates(@annonce.booking)
    elsif !@annonce.booking.blank? && !@annonce.airbnb.blank? # priorité au calendrier Airbnb
      @dates_renting = helpers.airbnb_dates(@annonce.airbnb)
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

  def renting_filters
      params_keys = [:start_date, :end_date, :capacity, :tarif]
      params_keys.all? {|k| params[:cure_options].has_key? k}
      cure_options = params[:cure_options].permit(params[:cure_options].keys).to_h
      cure_options.delete_if {|key, value| value == "" }
      annonces = Renting.all.where( "niederbronn_dist <= morsbronn_dist")
      if !cure_options.empty?
        annonces = annonces.where("capacity >= ?", cure_options[:capacity]) if cure_options.include?("capacity")
        annonces = annonces.where("price_cure_cents <= ?", (cure_options[:tarif].to_i * 100).to_s) if cure_options.include?("tarif")

        if cure_options.include?("start_date" && "end_date")
          annonces_dates_ok = helpers.check_calendar(annonces, cure_options["start_date"], cure_options["end_date"])
          annonces = annonces.where(id: annonces_dates_ok.map(&:id))
        end
        @annonces = annonces
      elsif cure_options.empty?
        @annonces = annonces
      end
      redirect_to location_niederbronn_landing_pages_path(:annonces => @annonces, param_2: 'value_2')
      #redirect_back(fallback_location: root_path, params: @annonces)
      #annonces = annonces.where("capacity >= ?", cure_options[:capacity]) if cure_options.include?("capacity")
      #annonces = annonces.where("price_cure_cents <= ?", (cure_options[:tarif].to_i * 100).to_s) if cure_options.include?("tarif")
  end

  private

  def renting_params
    params.require(:renting).permit(:titre, :description, :summary, :avatar, :capacity, :city, :zip_code, :address, :latitude, :longitude, :website, :email, :tel, :category, :airbnb, :booking, :price_day, :price_week, :price_cure, photos: [], renting_category_ids: [])
  end

  def set_seo
    set_meta_tags noindex: true
  end

  def set_data
    @annonce = Renting.find(params[:id])
  end
end
