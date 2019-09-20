class CreateInternationalVisitorInfors < ActiveRecord::Migration
  def change
    create_table :international_visitor_infors do |t|
      t.string :africa
      t.string :asia
      t.string :america
      t.string :europe
      t.integer :visitor_info_id

      t.timestamps
    end
  end
end
