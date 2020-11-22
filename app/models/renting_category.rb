class RentingCategory < ApplicationRecord
  has_many :renting_cats
  has_many :rentings, through: :renting_cats
end
