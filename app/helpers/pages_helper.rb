module PagesHelper
  def clean_dates_year(dates_array)
    array = dates_array
    today = DateTime.now.to_date
    ### 367
    array.map!.each { |date|
      Date.strptime(date)
    }
    array.map!.each { |date|
      array.delete(date) if date < today == true
    }
    array = array.compact
    array.map.each { |date|
      if date.strftime("%F").include?("2018")
        array.delete(date)
      end
    }

    return array
    #if  Date.strptime(date) < DateTime.now.to_date == true
    #    array.delete(date)
    #  else
    #end
    #https://www.airbnb.fr/calendar/ical/3518040.ics?s=ebdedb349a9e728f6ea0a11c903e2532
  end

  def clean_dates_month(dates_array)
    array = dates_array
    today = DateTime.now.to_date
  end


  def airbnb_dates(url) # dates bloquées sur airbnb pour calendrier
    require 'open-uri'
    airbnb = open(url).read

    list = airbnb.scan(/DTEND;([^abc]+)/).flatten
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
    #helpers.clean_dates_calendar(@dates)

    clean_array = @dates
    clean_array.each do |date|
      if DateTime.parse(date) < DateTime.now - 1
        clean_array.delete(date)
      end
    end
    return clean_array
  end

  def booking_dates(url) # dates bloquées sur booking pour calendrier
    require 'open-uri'
    booking = open(url).read
    list = booking.scan(/DTSTART;([^abc]+)/).flatten
    pattern = /:(\d{8})/

    dates = []
    list.each do |array|
      date_array = array.scan(pattern).flatten
      x =  date_array.map.each do |item|
        item.insert(4, '-')
        item.insert(7, '-')
      end
      dates << x.map {|item| Date.strptime(item)}
    end
    @dates = dates.map { |date| (date.first..date.last).map(&:to_s) }
    @dates = @dates.each { |array| array.pop }
    @dates = @dates.flatten
    #helpers.clean_dates_calendar(@dates)

    clean_array = @dates
    clean_array.each do |date|
      if DateTime.parse(date) < DateTime.now - 1
        clean_array.delete(date)
      end
    end
    return clean_array
  end

  def check_calendar(annonces, start_date, end_date)
    annonces_ok = []
    annonces.each do |rent|
      rent.dates_rented = airbnb_dates(rent.airbnb) if !rent.airbnb.blank?
      dates = (start_date...end_date).to_a
      if (rent.dates_rented & dates).empty?
        annonces_ok << rent
      else
      end
    end
    return annonces_ok
  end

end
