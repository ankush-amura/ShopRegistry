class Category < ApplicationRecord
  has_many :shops , as: :property
  validates :category, presence: true, uniqueness: true
end
