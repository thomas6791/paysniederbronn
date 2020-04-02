class TaxeSejour
  attr_reader :amount, :days, :people, :minors, :town, :price_ratings, :options, :client_name, :client_address, :invoice_number, :renting_name, :renting_address, :start_date, :end_date, :reglement, :zipcode, :renting_town, :client_zipcode, :client_town
  def initialize(amount, days, people, minors, town, options = 0, client_name = "", client_address = "", invoice_number = "", renting_name = "", renting_address = "", start_date = "", end_date = "", reglement = "", zipcode = "", renting_town = "", client_zipcode = "", client_town = "")
    @amount = amount
    @days = days
    @people = people
    @minors = minors
    @town = town
    @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes][@town]
    @price_ratings = []
    @options = options
    @client_name = client_name
    @client_address = client_address
    @client_zipcode = client_zipcode
    @client_town = client_town
    @invoice_number = invoice_number
    @renting_name = renting_name
    @renting_address = renting_address
    @renting_zipcode = zipcode
    @renting_town = renting_town
    @start_date = start_date
    @end_date = end_date
    @reglement = reglement
  end
  def people_pay
    return @people - @minors
  end

  def tax_day
    if @options != nil || @options != "" || @options != 0
      (((@amount - @options) / @days / @people) * @taxes[:taux].to_f * @taxes[:add_tax].to_f).round(2,half: :up)
    else
      ((@amount / @days / @people) * @taxes[:taux].to_f * @taxes[:add_tax].to_f).round(2,half: :up)
    end
  end

  def result
    (self.tax_day * self.people_pay * @days).round(2)
  end

  def price_ratings
    prices = []
    if self.tax_day < @taxes[:four].to_f
      prices << self.result
    else
      prices << (self.people_pay * @taxes[:four].to_f * @days).round(2)
    end
    prices << (self.people_pay * @taxes[:one].to_f * @days).round(2)
    prices << (self.people_pay * @taxes[:two].to_f * @days).round(2)
    prices << (self.people_pay * @taxes[:three].to_f * @days).round(2)
    prices << (self.people_pay * @taxes[:four].to_f * @days).round(2)
    prices << (self.people_pay * @taxes[:five].to_f * @days).round(2)
    @price_ratings = prices
  end

end
