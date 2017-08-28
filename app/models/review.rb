class Review < ApplicationRecord
 belongs_to :shop
 has_many   :replies
 validates :review, presence: true
end
