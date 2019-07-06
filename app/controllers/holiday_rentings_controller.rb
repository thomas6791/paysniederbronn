class HolidayRentingsController < ApplicationController
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
      render 'holiday_rentings/gites_heidelbeere'
    elsif
      @cards = YAML.load(File.read("config/cards.yml"))[:heidelbeere][locale.to_s]
      render 'holiday_rentings/en.gites_heidelbeere'
    else
    end
    @bonjour = "Hello"
  end

  def meuble_heidelbeere
    if locale != :fr
      render 'holiday_rentings/gites-heidelbeere/#{locale.to_s}.meuble-heidelbeere'
    else
      render 'holiday_rentings/gites-heidelbeere/fr.meuble-heidelbeere'
    end
  end
end
