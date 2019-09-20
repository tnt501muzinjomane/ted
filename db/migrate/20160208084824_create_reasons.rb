class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :reason
      t.integer :nump
      t.string :citizen
      t.integer :user_id

      t.timestamps
    end
  end
end
