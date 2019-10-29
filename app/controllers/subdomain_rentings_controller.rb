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

    @meetings = Event.all
  end

  private

  def set_seo
    set_meta_tags noindex: true
  end

  def initial_events
    require 'open-uri'
    Event.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!(Event.table_name)
    Event.create(name: "test", start_time: Time.now + 3600 * 24 * 2)
    Event.create(name: "bonjour", start_time: Time.now)
    url_studio = "https://www.airbnb.fr/calendar/ical/4176483.ics?s=5168a985ff51e67f88aea39c1532bca5"
    #ActiveSupport::JSON.decode(string.gsub(/:([a-zA-z])/,'\\1').gsub('=>', ' : '))
    @airbnb = Net::HTTP.get(URI.parse(url_studio))

    list = @airbnb.scan(/DTEND;([^abc]+)/).flatten
    pattern = /:(\d{8})/
    #match_data = list[23].scan(pattern).flatten

    list.each do |array|
      z = array.scan(pattern).flatten
      z.each do |item|
        item.insert(4, '-')
        item.insert(7, '-')
      end
      Event.create(name: "thomas", start_time: z[0], end_time: z[1])
      #Event.last.end_time = Event.last.end_time - 1.day
    end
  end
end
