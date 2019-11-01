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


    dates = []
    list.each do |array|
      date_array = array.scan(pattern).flatten
      x =  date_array.map.each do |item|
        item.insert(4, '-')
        item.insert(7, '-')
      end
      dates << x.map {|item| Date.strptime(item)}
    end
    @dates = dates.map { |date| (date[1]..date[0]).map(&:to_s) }
    @dates = @dates.each { |array| array.pop }
    @dates = @dates.flatten
    clean_array = helpers.clean_dates_calendar(@dates)
    fail
    @dates = clean_array

  end
end
