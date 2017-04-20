class Patient < ActiveRecord::Base
   def self.search(search_for)
       Patient.where("lastname = ?", search_for)
   end
  has_many :appointments
  has_many :physicians, through: :appointments
end
