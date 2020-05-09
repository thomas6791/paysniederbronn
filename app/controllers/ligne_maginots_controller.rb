class LigneMaginotsController < ApplicationController
  before_action :set_date, only: [:four_a_chaux]
  before_action :set_seo
  def index
  end

  def alsace
  end

  def lorraine
  end

  def four_a_chaux
    set_meta_tags noindex: false,
    title: "Four à Chaux de Lembach | Ouvrage de la Ligne Maginot d'Alsace",
    description: "Visite du four à chaux de lembach, un des plus imposants ouvrage de la ligne maginot avec un musée au programme et de nombreux éléments datant de l'époque. Horaires, contact et informations",
    canonical: "http://www.paysniederbronn.fr/fr/ligne-maginot/alsace/four-a-chaux-de-lembach",
    alternate: { "#{locale.to_s}" => "http://www.paysniederbronn.fr/#{locale.to_s}/ligne-maginot-alsace/four-a-chaux-lembach" }
  end

  def dambach
  end

  def set_date
    @day = Time.now.strftime("%a").downcase
  end
  def set_seo
    set_meta_tags noindex: true
  end
end
