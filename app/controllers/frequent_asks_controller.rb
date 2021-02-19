class FrequentAsksController < ApplicationController
  def index
  end

  def show
    fail
  end

  def edit
    fail
  end

  def new
    @frequent_ask = FrequentAsk.new
    fail
  end

  def create
    fail
  end

  def update
    fail
  end

  def destroy
  end

  private
  def polymorph_params
    #params.require(:frequent_asks).permit(:question, :answer, :public)
  end
end
