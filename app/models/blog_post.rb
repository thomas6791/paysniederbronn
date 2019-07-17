class BlogPost < ApplicationRecord
  belongs_to :author_blog
  has_many :blog_post_categories, dependent: :destroy
  has_many :blog_categories, through: :blog_post_categories
  validates :title, uniqueness: { message: "cette title est déjà prise" }
  validates :titre, uniqueness: { message: "ce titre est déjà pris" }
  validates :slug, uniqueness: { message: "slug déjà prise" }
  after_validation :set_slug, only: [:create, :update]
  after_create :set_custom_date

  def to_param
    #{}"#{id}-#{slug}"
    "#{slug}"
  end

  def author
    AuthorBlog.find(self.author_blog_id)
  end

  private

  def set_slug
    self.slug = titre.to_s.parameterize
  end

  def set_custom_date
    if self.custom_date.nil?
      self.custom_date = self.created_at
      self.save!
    end
  end
end
