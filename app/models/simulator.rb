class Simulator < ApplicationRecord
  def initialize(amount, days, people, minors)
    @amount = amount
    @days = days
    @people = people
    @minors = minors
  end
end
