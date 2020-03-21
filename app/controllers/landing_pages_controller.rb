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
              description: "les produits locaux et supermarché d'Alsace du Nord",
              canonical: "https://www.paysniederbronn.fr/fr/alimentation"

              #noindex: true
  end
  def attraction
    set_meta_tags title: "Parcs d'attraction & aquatiques en et proche de l'Alsace",
              description: "Europapark, Rulantica, Didiland ou encore BadeParadise, autant de parcs à thèmes où il est facile de s'y amuser"
  end

  def cures_thermales
    set_meta_tags title: "Cure thermale, thermes et stations en Alsace",
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
