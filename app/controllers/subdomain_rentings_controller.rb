class SubdomainRentingsController < ApplicationController
  before_action :set_seo
  layout 'gite'
  def index
  end

  def simulator
    render 'pages/simulator'
  end

  private

  def set_seo
    set_meta_tags noindex: true
  end
end
