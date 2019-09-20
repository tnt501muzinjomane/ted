class AddColumnEstablishmentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :establishment_id, :string
  end
end
