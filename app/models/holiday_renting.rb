class HolidayRenting < ApplicationRecord
  #validates :title, uniqueness: { message: "cette title est déjà prise" }
  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  after_validation :set_slug, only: [:create]
  after_validation :set_category, only: [:create]
  has_rich_text :description
  has_many_attached :photos

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = titre.to_s.parameterize
  end

  def set_category
    self.category = "renting"
  end
end
