class PagesController < ApplicationController
  require 'yaml'
  def home
  end
  def alentours

    @cards = YAML.load(File.read("config/cards.yml"))[:cards][locale.to_s]
  end

  def holidayrentings
  end

  def contact
  end

  def about
  end

  def simulator
    if params[:results].present?
      @taxes_sejour = params[:results].first[:prices]
    end
  end

  def result
    amount = params[:taxe_sejour][:amount].to_f
    days = params[:taxe_sejour][:days].to_f
    people = params[:taxe_sejour][:people].to_f
    minors = params[:taxe_sejour][:minors].to_f
    town = "niederbronn"
    @taxe_sejour = TaxeSejour.new(amount, days, people, minors, town)
    redirect_to simulateur_path(results: [prices: @taxe_sejour.price_ratings])
  end
end
