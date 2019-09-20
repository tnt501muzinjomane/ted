class Package < ActiveRecord::Base

def self.search(query)
  where("establishment_id = ? ", "#{query}") 
end

require 'csv'

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv.add_row column_names
    all.each do |p|
      values = p.attributes.values
      csv.add_row values
    end
  end
end


end
