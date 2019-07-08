class TaxeSejour
  attr_reader :amount, :days, :people, :minors, :town
  def initialize(amount, days, people, minors, town)
    @amount = amount
    @days = days
    @people = people
    @minors = minors
    @town = town
    @taxes = YAML.load(File.read("config/taxes.yml"))[:taxes][@town]
  end
  def people_pay
    return @people - @minors
  end

  def tax_day
    ((@amount / @days / @people) * 0.05 * @taxes[:add_tax].to_f).round(2,half: :up)
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
  end
end
