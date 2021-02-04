class LandingPagesController < ApplicationController
  before_action :set_articles
  def ligne_maginot_alsace
    set_meta_tags title: "La ligne maginot en alsace du nord",
              description: "la ligne maginot, ouvrages, bunkers présents en alsace du nord",
              canonical: "https://www.paysniederbronn.fr/fr/ligne-maginot-alsace"
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
  end
  def attraction
    set_meta_tags title: "Parcs d'attraction & aquatiques en et proche de l'Alsace",
              description: "Europapark, Rulantica, Didiland ou encore BadeParadise, autant de parcs à thèmes où il est facile de s'y amuser",
              canonical: "https://www.paysniederbronn.fr/fr/parcs-attractions"
  end

  def cures_thermales
    set_meta_tags title: "Cure thermale en Alsace | les stations thermales",
              description: "Les établissements thermaux conventionnés proposant des cures en Alsace",
              canonical: "https://www.paysniederbronn.fr/fr/cures-thermales"
  end
  def station_niederbronn
    set_meta_tags title: "Station thermale de Niederbronn les bains, établissement de cure en Alsace",
              description: "Faire une cure thermale en alsace dans la station thermale de Niederbronn",
              canonical: "https://www.paysniederbronn.fr/fr/cures-thermales/station-thermale-niederbronn"
  end
  def station_morsbronn
    set_meta_tags title: "Station thermale de Morsbronn les bains, établissement de cure en Alsace",
              description: "cures thermales présentes dans les vosges du nord d'alsace",
              canonical: "https://www.paysniederbronn.fr/fr/cures-thermales/station-thermale-morsbronn"
  end

  def location_cure_niederbronn
    set_meta_tags title: "Locations pour cure thermale à Niederbronn-les-bains | Pays de Niederbronn",
              description: "Les locations pour curistes à Niederbronn-les-Bains",
              canonical: "https://www.paysniederbronn.fr/fr/cures-thermales/station-thermale-niederbronn/location-cure-niederbronn"
    #@annonces = Renting.all.where(category:"renting")

    @annonces = Renting.all.where( "niederbronn_dist <= morsbronn_dist")
    @flats = @annonces.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end

    if params.include?("cure_options")
      params_keys = [:start_date, :end_date, :capacity, :tarif]
      if params_keys.all? {|k| params[:cure_options].has_key? k}
        cure_options = params[:cure_options].permit(params[:cure_options].keys).to_h
        cure_options.delete_if {|key, value| value == "" }
        #Book.where("title = ? AND out_of_print = ?", params[:title], false)
      else
        #...
      end
      annonces_valid = []
      @annonces = @annonces.where.not(airbnb: '')
      @annonces.each do |rent|
        rent.dates_rented = helpers.airbnb_dates(rent.airbnb)
        dates = (params[:cure_options][:start_date]...params[:cure_dates][:end_date]).to_a # dates -1

        if dates.any? {|date| rent.dates_rented.include?(date) } # check si les dates entrées sont dans les dates airbbn
          #contient
        else
          #ne contient pas
          annonces_valid << rent
        end
      end
      @annonces = Renting.where(id: annonces_valid.map(&:id))
      @flats = @annonces.geocoded

      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude
        }
      end
      #request.fullpath
    end
  end

  def location_cure_morsbronn
    set_meta_tags title: "Locations pour cure thermale à Morsbronn-les-bains | Pays de Niederbronn",
              description: "Les locations pour curistes à Morsbronn-les-Bains",
              canonical: "https://www.paysniederbronn.fr/fr/cures-thermales/station-thermale-morsbronn/location-cure-morsbronn",
              noindex: true
    @annonces = Renting.all.where( "morsbronn_dist <= niederbronn_dist")
    @flats = @annonces.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  private
  def set_articles
    @articles = Article.joins(:category)
  end

end
