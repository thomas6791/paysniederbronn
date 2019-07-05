class HolidayRentingsController < ApplicationController
  def index
    @annonces = HolidayRenting.all
  end

  def show
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
    if locale.to_s == "fr"
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
    if locale.to_s == "fr"
      render 'holiday_rentings/gites-heidelbeere/fr.meuble_heidelbeere'
    elsif locale.to_s == "en"
      render 'holiday_rentings/gites-heidelbeere/en.meuble_heidelbeere'
    end
  end
end
