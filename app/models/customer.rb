class Customer < ApplicationRecord

   # validates the presence of name while submitting the data to the database model
   validates :name, presence: true

   # validates the confirmation of the email if both the written emails are same
   validates :email ,confirmation: true

   # validates password with confirmation and uniqueness and length attributes
   validates :password , confirmation: true , uniqueness: true , length: {minimum: 8}

   # validates contact info for its uniqueness and numericality 
   validates :contact , uniqueness: true , numericality: true , length: { is: 10 }
end
