class Superadmin < ApplicationRecord

  # each superadmin can have many moderators and hence can add or remove moderators
  has_many :moderators

  # validating the name which should be present whicle inserting into database table
  validates :name, presence: true

  # validating email id for its confirmation to be provided
  validates :email ,confirmation: true

  # validating the password with confirmation and length attributes
  validates :password , confirmation: true , uniqueness: true , length: {minimum: 8}

  # validating the contact with uniqueness and numericality
  validates :contact , uniqueness: true , numericality: true , length: { is: 10 }


end
