class Moderator < ApplicationRecord

   # each superadmin has a number of moderators and hence each moderator belongs to some superadmin
   belongs_to :superadmin

   # each superadmin can assign many sales persons under his observation and hence has many associattion applies
   has_many   :sales

   # each moderator is assigned a name with validation as presence that is nill is not accepted
   validates :name, presence: true

   # each moderator is assigned a email with validation as presence and confirmation that is nill is not accepted
   validates :email ,presence: true,confirmation: true

   # each moderator is provided address fields with validation as presence that is nill is not accepted
   validates :password ,presence: true , confirmation: true , uniqueness: true , length: {minimum: 8}

   # each moderator has a contact provided with validation as presence,uniqeness,and numericality
   validates :contact ,presence: true ,  uniqueness: true , numericality: true , length: { is: 10 }


end
