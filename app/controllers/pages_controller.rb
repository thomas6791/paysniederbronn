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
      taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
      datas = params[:results].first
      taxes_towns = []
      taxes.each do |key, value|
        taxes_towns << TaxeSejour.new(datas[:amount].to_f, datas[:days].to_f, datas[:people].to_f, datas[:minors].to_f, key)
      end
      fail
      #taxes_towns[0].town[0]
    end
  end

  def result
    amount = params[:taxe_sejour][:amount].to_f
    days = params[:taxe_sejour][:days].to_f
    people = params[:taxe_sejour][:people].to_f
    minors = params[:taxe_sejour][:minors].to_f
    town = "niederbronn"
    @taxe_sejour = TaxeSejour.new(amount, days, people, minors, town)
    redirect_to simulateur_path(results: [prices: @taxe_sejour.price_ratings, amount: @taxe_sejour.amount, days: @taxe_sejour.days, people: @taxe_sejour.people, minors: @taxe_sejour.minors, town: @taxe_sejour.town ])
  end
end
