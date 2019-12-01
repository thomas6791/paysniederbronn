class LandingPagesController < ApplicationController
  before_action :set_articles
  def ligne_maginot_alsace
    set_meta_tags title: "La ligne maginot en alsace du nord",
              description: "la ligne maginot, ouvrages, bunkers présents en alsace du nord"
  end
  def chateaux_forts
    set_meta_tags title: "Les chateaux forts en alsace des vosges du nord",
              description: "Les circuits de randonnées en Alsace du Nord"
              #@chateaux = Category.joins(:articles).uniq
    @chateaux = []
    @articles.each { |article| @chateaux << article if article.category.name == 'chateau fort alsace' }
  end
  def randonnees
    set_meta_tags title: "Les circuits de randonnées en Alsace du Nord",
              description: "Les circuits de randonnées en Alsace du Nord"
  end
  def strasbourg
    set_meta_tags title: "Visiter strasbourg",
              description: "Visiter Strasbourg"
  end
  def alimentation
    set_meta_tags title: "Produits locaux et supermarché d'Alsace du Nord",
              description: "les produits locaux et supermarché d'Alsace du Nord"
              #noindex: true
  end

  def marches_noel
    set_meta_tags title: "Marchés de noel en Alsace",
              description: "les marchés de noel dans l'ensemble de l'Alsace"
  end
  def cures_thermales
    set_meta_tags title: "Cure thermale et station en Alsace des Vosges du Nord",
              description: "cures thermales présentes dans les vosges du nord d'alsace"
  end
  def station_niederbronn
    set_meta_tags title: "Station thermale de Niederbronn, établissement de cure en alsace",
              description: "Faire une cure thermale en alsace dans la station thermale de Niederbronn"
  end
  def station_morsbronn
    set_meta_tags title: "Station thermale de Morsbronn, établissement de cure",
              description: "cures thermales présentes dans les vosges du nord d'alsace",
              noindex: true
  end

  private
  def set_articles
    @articles = Article.joins(:category)
  end

end
