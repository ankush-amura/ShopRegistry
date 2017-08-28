class Sale < ApplicationRecord
  belongs_to :moderator
  has_many :shops, as: :property
  validates :name, presence: true
  validates :email ,confirmation: true
  validates :password , confirmation: true , uniqueness: true , length: {minimum: 8}
  validates :contact , uniqueness: true , numericality: true , length: { is: 10 }

end
