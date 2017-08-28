class City < ApplicationRecord
   has_many :areas
   has_many :shops, as: :property
end
