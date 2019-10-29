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
    Event.destroy_all
    Event.create(name: "test", start_time: Time.now + 3600)
    Event.create(name: "test", start_time: Time.now)
    @meetings = Event.all
  end

  private

  def set_seo
    set_meta_tags noindex: true
  end

  def initial_events
  end
end
