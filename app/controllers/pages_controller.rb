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
    if params[:results].present?
      @tax_day = params[:results][0][:tax_day]
      @result_nc = params[:results][0][:result]
      @people_pay = params[:results][0][:people_pay].to_i
      @days = params[:results][0][:days]
      @one = @people_pay * @taxes[:one].to_f * @days
      @two = @people_pay * @taxes[:two].to_f * @days
      @three = @people_pay * @taxes[:three].to_f * @days
      @four = @people_pay * @taxes[:four].to_f * @days
      @five = @people_pay * @taxes[:five].to_f * @days
    end
  end

  def result
    taxes = YAML.load(File.read("config/taxes.yml"))[:taxes]
    amount = params[:taxe_sejour][:amount].to_f
    days = params[:taxe_sejour][:days].to_f
    people = params[:taxe_sejour][:people].to_f
    minors = params[:taxe_sejour][:minors].to_f
    people_pay = people - minors
    tax_day = ((amount / days / people) * 0.05 * 1.10).round(2,half: :up)
    result = (tax_day * people_pay * days).round(2)
    redirect_to simulateur_path(results: [tax_day: tax_day, result: result, people_pay: people_pay, days: days])
  end
end
