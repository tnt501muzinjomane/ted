class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.decimal :cost, :precision => 10, :scale => 2
      t.string :establishment_id

      t.timestamps
    end
  end
end
