class Area < ApplicationRecord

   # An area can have multiple shops hence this association
   has_many   :shops , as: :property

   # a particular area belongs to a city 
   belongs_to :city
 end
