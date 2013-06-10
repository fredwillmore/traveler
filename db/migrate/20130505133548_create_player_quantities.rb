class CreatePlayerQuantities < ActiveRecord::Migration
  def change
    create_table :player_quantities do |t|
      t.integer :player_id
      t.integer :quantity_id
      t.float :value
      t.float :max_value
    end
  end
end
