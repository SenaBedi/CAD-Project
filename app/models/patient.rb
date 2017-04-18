class Patient < ActiveRecord::Base
   def self.search(search_for)
       Patient.where("lastname = ?", search_for)
   end
end
