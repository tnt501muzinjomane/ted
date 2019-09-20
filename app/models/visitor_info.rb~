class VisitorInfo < ActiveRecord::Base

require 'csv'

def self.to_csv
    CSV.generate do |csv|
      csv << ["ID", "Date of arrival", "Mode of transport", "Male", "Female", "Travel", "Travel partnership", "Citizen", "user_id", "Below 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 +"] ## Header values of CSV
      all.each do |emp|
        csv << [emp.id, emp.date_of_arrival, emp.mode_of_transport, emp.male, emp.female, emp.travel, emp.partner, emp.citizenship, emp.user_id, emp.Below_18, emp.age18_24, emp.age25_34, emp.age35_44, emp.age45_54, emp.age55_64 , emp.age65] ##Row values of CSV
      end
    end
  end


end
