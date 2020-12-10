class Randonnee < ApplicationRecord
  has_rich_text :rich_body
  has_one_attached :photo
end
