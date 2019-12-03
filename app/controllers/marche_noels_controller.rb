class MarcheNoelsController < ApplicationController

  def index
    set_meta_tags title: "Marchés de noel en Alsace",
                description: "les marchés de noel dans l'ensemble de l'Alsace"
    @marches = MarcheNoel.all.order(:name)
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
