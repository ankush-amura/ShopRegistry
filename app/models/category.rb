class Category < ApplicationRecord

  # A particular category of shop can have many shops within and so this relation is specified
  has_many :shops , as: :property

  # validation is provided for category attribute for its presence and uniqueness
  validates :category, presence: true, uniqueness: true
end
