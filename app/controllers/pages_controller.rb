class PagesController < ApplicationController
  before_action :set_seo
  require 'yaml'
  def home
  end
  def alentours
    @page_title = 'Aux alentours : les curiosités en Alsace'
    #set_meta_tags canonical: "http://yoursite.com/canonical/url"

    @cards = YAML.load(File.read("config/cards.yml"))[:cards][locale.to_s]
    #redirect_to root_path
  end

  def holidayrentings
    redirect_to root_path
    set_meta_tags noindex: true
  end

  def contact
    set_meta_tags noindex: true
  end

  def about
    set_meta_tags noindex: true
  end

  def mentions
    set_meta_tags noindex: true
  end

  def tarifs
  end

  def simulator
    if params[:results].present?
      @taxes_sejour = params[:results].first[:prices]
      @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
      datas = params[:results].first
      @taxes_town = []
      @towns = Array.new
        @taxes.each do |key, value|
          town = @taxes[key]
          @taxes_town << TaxeSejour.new(datas[:amount].to_f, datas[:days].to_f, datas[:people].to_f, datas[:minors].to_f, key).price_ratings
          @towns << key
        end
      @hash_town = Hash[@towns.zip @taxes_town]
      @hash_town = @hash_town.reject { |k,v| k == "niederbronn" }
    end
  end

  def taxe_invoice
    if params[:result_invoice].present?
      datas = params[:result_invoice][0]
      @people = datas[:people]
      @minors = datas[:minors]
      @amount = datas[:amount]
      rating = datas[:rating]
      @days = datas[:days]
      @options = params[:result_invoice][0][:options] unless params[:result_invoice][0][:options] == ["0.0"]

      if datas[:rating] == "non classé"
        @taxe = datas[:taxes][0]
      else
        @taxe = datas[:taxes][datas[:rating].to_i]
      end
      @single_tax = sprintf('%.2f', @taxe.to_f / @days.to_i / (@people.to_i - @minors.to_i))
    end
  end

  def result_invoice
    #@taxe_sejour = TaxeSejour.new(amount, days, people, minors, town)
    @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
    datas = params[:taxe_sejour]
    options = datas.keys.grep(/option/)
    options_price = datas.keys.grep(/tarif/)
    name_options_array = []
    new_array = []

    options.each_with_index do |option, index|
      name_options_array << datas[options[index]]
    end

    options_price.each_with_index do |element, index|
      new_array << datas[options_price[index]].to_f
    end

    options_hash = Hash[name_options_array.zip new_array]

    @taxe_sejour = TaxeSejour.new(datas[:amount].to_f, datas[:days].to_f, datas[:people].to_f, datas[:minors].to_f, datas[:town].downcase).price_ratings
    redirect_to taxe_invoice_path(result_invoice: [taxes: @taxe_sejour, amount: datas[:amount], days: datas[:days], people: datas[:people], minors: datas[:minors], rating: datas[:rating], options: options_hash ])
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

  def set_seo
  end
end
