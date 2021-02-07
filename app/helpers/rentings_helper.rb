module RentingsHelper
  def scraping
    require 'open-uri'
    require 'nokogiri'

    urls = ["https://www.niederbronn.com/se-loger/meubles-de-tourisme-chambres.html",
      "https://www.niederbronn.com/se-loger/meubles-de-tourisme-chambres.html?a=1&calctot=1&limitstart=20",
      "https://www.niederbronn.com/se-loger/meubles-de-tourisme-chambres.html?a=1&calctot=1&start=40",
      "https://www.niederbronn.com/se-loger/meubles-de-tourisme-chambres.html?a=1&calctot=1&start=60",
      "https://www.niederbronn.com/se-loger/meubles-de-tourisme-chambres.html?a=1&calctot=1&start=80"
    ]
    puts "bonjour"

    loc_urls = []

    urls.each do |url|
      puts url
    end

    urls.each do |url|

      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('.joomlei_result a').each do |element|
        #puts element.attribute('href').value
        loc_urls << "https://www.niederbronn.com#{element.attribute('href').value}"
      end

    end

    #loc_urls.each do |url|
    #  html_file = open(url).read
    #  html_doc = Nokogiri::HTML(html_file)
    #end

    puts loc_urls
    puts loc_urls.size
  end

  def geocode_cure(annonce)
    annonce.morsbronn_dist = annonce.distance_to(Renting::CURE_MORSBRONN).round(2)
    annonce.niederbronn_dist = annonce.distance_to(Renting::CURE_NIEDERBRONN).round(2)
    annonce.save!
  end


end
