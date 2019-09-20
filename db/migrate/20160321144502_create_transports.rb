class CreateTransports < ActiveRecord::Migration
  def change
    create_table :transports do |t|
      t.string :trans
      t.integer :nump
      t.string :citizen
      t.integer :user_id
      t.string :rdate
      t.integer :visitor_id

      t.timestamps
    end
  end
end
