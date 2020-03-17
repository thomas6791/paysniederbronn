class MarcheNoel < HolidayRenting
  after_validation :set_category, only: [:create]

  private
  def set_category
    self.category = "marche"
  end
end
