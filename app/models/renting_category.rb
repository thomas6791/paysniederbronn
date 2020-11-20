class RentingCategory < ApplicationRecord
  has_and_belongs_to_many :rentings
end
