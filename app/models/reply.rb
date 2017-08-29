class Reply < ApplicationRecord

  # each reply that is given by a particular customer should be  provided a refrence to the Review
  belongs_to :review

end
