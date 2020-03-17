class HolidayRenting < ApplicationRecord
  #validates :title, uniqueness: { message: "cette title est déjà prise" }
  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  after_validation :set_slug, only: [:create]
  has_rich_text :description

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = titre.to_s.parameterize
  end
end
