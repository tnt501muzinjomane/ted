class EstablishmentDashboard < ActiveRecord::Base

def self.search(query)
  where("user_id = ? ", "#{query}") 
end

end
