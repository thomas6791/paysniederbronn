class HolidayrentingsController < ApplicationController
  def index
  end

  def show
  end

  def new
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

    if locale.to_s == "fr"
      render 'holidayrentings/gites_heidelbeere'
    elsif
      render 'holidayrentings/en.gites_heidelbeere'
    else
    end


    @bonjour = "Hello"
  end

  def meuble_heidelbeere
    render 'holidayrentings/gites-heidelbeere/fr.meuble_heidelbeere'
  end

end
