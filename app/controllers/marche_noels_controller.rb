class MarcheNoelsController < ApplicationController

  def index
    set_meta_tags title: "Marchés de noel en Alsace",
                description: "les marchés de noel dans l'ensemble de l'Alsace",
                canonical: "https://www.paysniederbronn.fr/fr/marches-noel"
    @marches = MarcheNoel.all.where(category: "marche").order(:titre)
  end

  def new
  end

  def create
  end

  def show
    @marche_noel = MarcheNoel.find(params[:id])
    set_meta_tags noindex: true
  end

  def edit
  end

  def update
  end
end
