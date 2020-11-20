class Renting < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :renting_categories
  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  after_validation :set_slug, only: [:create]

  has_rich_text :description
  has_many_attached :photos

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :set_category, only: [:create]

  def to_param
    "#{id}-#{slug}"
  end

  def full_address
    [address, zip_code, city].compact.join(', ')
  end

  private

  def set_category
    self.category = "renting"
  end

  def set_slug
    self.slug = titre.to_s.parameterize
  end

end
