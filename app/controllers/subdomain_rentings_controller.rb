class SubdomainRentingsController < ApplicationController
  before_action :set_seo
  before_action :initial_events, only: [:calendar]
  layout 'gite'
  def index
    render "subdomain_rentings/#{params[:subdomain]}/index"
  end

  def renting1
    @name = "Appartement 100m<sup>2</sup>"
    render "subdomain_rentings/#{params[:subdomain]}/renting1"
  end
  def renting2
    @name = "Studio"
    render "subdomain_rentings/#{params[:subdomain]}/renting2"
  end

  def simulator
    render 'pages/simulator'
  end

  def calendar
    @name = "test"
  end

  private

  def set_seo
    set_meta_tags noindex: true
  end

  def initial_events
    require 'open-uri'
    url_studio = "https://www.airbnb.fr/calendar/ical/4176483.ics?s=5168a985ff51e67f88aea39c1532bca5"
    #ActiveSupport::JSON.decode(string.gsub(/:([a-zA-z])/,'\\1').gsub('=>', ' : '))
    @dates = helpers.airbnb_dates(url_studio)
    #@dates = clean_array

  end
end
