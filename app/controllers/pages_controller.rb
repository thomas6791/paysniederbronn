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
    @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
  end

  def result
    taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
    fail
  end
end
