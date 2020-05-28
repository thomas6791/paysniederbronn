class Renting < ApplicationRecord
  after_validation :set_category, only: [:create]

  private
  def set_category
    self.category = "renting"
  end
end
