class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.string :partnership
      t.integer :nump
      t.string :citizen
      t.integer :user_id
      t.string :rdate
      t.integer :visitor_id

      t.timestamps
    end
  end
end
