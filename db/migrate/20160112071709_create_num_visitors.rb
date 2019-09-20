class CreateNumVisitors < ActiveRecord::Migration
  def change
    create_table :num_visitors do |t|
      t.integer :visitor_infor_id
      t.integer :numv

      t.timestamps
    end
  end
end
