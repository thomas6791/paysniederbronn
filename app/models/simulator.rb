class Simulator < ApplicationRecord
  require 'active_record/validations'
  def initialize(amount, days, people, minors)
    @amount = amount
    @days = days
    @people = people
    @minors = minors
  end
end
