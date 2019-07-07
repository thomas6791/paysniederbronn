class LigneMaginotsController < ApplicationController
  before_action :set_date, only: [:four_a_chaux]
  def index
  end

  def alsace
  end

  def lorraine
  end

  def four_a_chaux
  end

  def dambach
  end

  def set_date
    @day = Time.now.strftime("%a").downcase
  end
end
