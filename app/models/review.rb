class Review < ApplicationRecord

  # Each review that is provided by the customer should belong to a particular shop
  # and that should be reflected in database
  belongs_to :shop

  # Each review can have more that one replies that can be given by the customers
  has_many   :replies

  #validation should be provided in order to keep reiew present while inserting data nill not accepted
  validates :review, presence: true
end
