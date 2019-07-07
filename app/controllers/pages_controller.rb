class PagesController < ApplicationController
  def home
  end
  def alentours
    require 'yaml'
    @cards = YAML.load(File.read("config/cards.yml"))[:cards][locale.to_s]
  end

  def holidayrentings
  end

  def contact
  end

  def about
  end

  def simulator
    require 'yaml'
    @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
    @result = Simulator.new
  end
end
