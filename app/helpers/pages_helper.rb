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
end
