class LigneMaginotsController < ApplicationController
  def index
  end

  def alsace
  end

  def lorraine
  end

  def four_a_chaux
    @day = Time.now.strftime("%a").downcase
  end

  def dambach
  end
end
