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
    require 'json'
    require 'open-uri'
    @name = "test"
    @meetings = Event.all
    url_studio = "https://www.airbnb.fr/calendar/ical/4176483.ics?s=5168a985ff51e67f88aea39c1532bca5"
    #ActiveSupport::JSON.decode(string.gsub(/:([a-zA-z])/,'\\1').gsub('=>', ' : '))
    @airbnb = Net::HTTP.get(URI.parse(url_studio))

    #match_data = @airbnb.scan(/DTEND(.*)VALUE=DATE:\d{8}/)


    #x = @airbnb.scan(/DTEND(.*)VALUE=DATE:\d{8}/)
    x = @airbnb.scan(/DTEND;([^abc]+)/)
    #y = @airbnb.scan(/VALUE=DATE:\d{8}/)

    #url = 'https://api.github.com/users/ssaunier'
    #user_serialized = open(url_studio).read
    #user = JSON.parse(user_serialized)
    fail
  end

  private

  def set_seo
    set_meta_tags noindex: true
  end

  def initial_events
    Event.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!(Event.table_name)
    Event.create(name: "test", start_time: Time.now + 3600 * 24 * 2)
    Event.create(name: "bonjour", start_time: Time.now)
  end
end
