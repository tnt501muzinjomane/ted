class CreateVisitorPackages < ActiveRecord::Migration
  def change
    create_table :visitor_packages do |t|
      t.integer :visitor_infor_id
      t.integer :package_id

      t.timestamps
    end
  end
end
