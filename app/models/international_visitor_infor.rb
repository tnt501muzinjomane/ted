class InternationalVisitorInfor < ActiveRecord::Base

require 'csv'

def self.to_csv
    CSV.generate do |csv|
      csv << ["Africa", "Asia", "America", "Europe", "Visitor ID", "Date", "User ID"] ## Header values of CSV
      all.each do |emp|
        csv << [emp.africa, emp.asia, emp.america, emp.europe, emp.visitor_info_id, emp.rdate, emp.user_id] ##Row values of CSV
      end
    end
  end
end
