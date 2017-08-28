class Area < ApplicationRecord
   has_many   :shops , as: :property
   belongs_to :city
 end
