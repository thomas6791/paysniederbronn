class Renting < ApplicationRecord
  belongs_to :user
  has_many :renting_cats
  has_many :renting_categories, through: :renting_cats
  has_many :frequent_asks, as: :frequentasked, :dependent => :destroy
  accepts_nested_attributes_for :frequent_asks
  has_rich_text :description
  has_many_attached :photos
  has_one_attached :avatar

  register_currency :eur
  monetize :price_day_cents, as: "price_day", with_currency: :eur
  monetize :price_week_cents, as: "price_week", with_currency: :eur
  monetize :price_cure_cents, as: "price_cure", with_currency: :eur
  # Lat, Lng
  CURE_NIEDERBRONN = [48.950530, 7.643330].freeze
  CURE_MORSBRONN = [48.906250, 7.746870].freeze

  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true

  validates :photos, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']



  after_validation :set_slug, only: [:create]
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :set_category, only: [:create]

  attr_accessor :dates_rented

  def to_param
    "#{id}-#{slug}"
  end

  def full_address
    [address, zip_code, city].compact.join(', ')
  end

  private

  def set_category
    if self.category.nil? || self.category.blank?
      self.category = "renting"
    end
  end

  def set_slug
    self.slug = titre.to_s.parameterize
  end

end
