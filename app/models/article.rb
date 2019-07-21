class Article < ApplicationRecord
  belongs_to :category
  #has_many :post_categories
  #has_many :post_categories, dependent: :destroy
  #has_many :categories, through: :post_categories

  validates :title, uniqueness: { message: "cette title est déjà prise" }
  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  after_validation :set_slug, only: [:create, :update]

  def to_param
    #{}"#{id}-#{slug}"
    "#{slug}"
  end

  private
  def set_slug
    self.slug = titre.to_s.parameterize
  end
end
