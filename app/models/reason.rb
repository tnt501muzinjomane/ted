class Reason < ActiveRecord::Base

require 'csv'

def self.to_csv
    CSV.generate do |csv|
      csv << ["ID", "Reason", "Number of visitors", "Citizen", "User ID", "Date"] ## Header values of CSV
      all.each do |emp|
        csv << [emp.id, emp.reason, emp.nump, emp.citizen, emp.user_id, emp.rdate] ##Row values of CSV
      end
    end
  end

end
