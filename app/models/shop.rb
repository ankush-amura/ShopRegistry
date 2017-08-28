class Shop < ApplicationRecord
belongs_to :property , polymorphic: true
has_many   :reviews
validates :name,      presence: true
validates :city ,     confirmation: true
validates :area ,     presence: true
validates :contact ,  uniqueness: true , numericality: true , length: { is: 10 }

end
