class Country < ActiveRecord::Base

require 'csv'

def self.to_csv
    CSV.generate do |csv|
      csv << ["ID", "Visitor ID", "Name", "Number of visitors", "Date", "User ID"] ## Header values of CSV
      all.each do |emp|
        csv << [emp.id, emp.visitor_id, emp.name, emp.num_v, emp.datev, emp.user_id] ##Row values of CSV
      end
    end
  end
end
