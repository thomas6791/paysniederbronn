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
  end

  def clean_dates_month(dates_array)
    array = dates_array
    today = DateTime.now.to_date
  end


  def airbnb_dates(url)
    airbnb = Net::HTTP.get(URI.parse(url))

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
end
