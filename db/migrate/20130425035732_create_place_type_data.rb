class CreatePlaceTypeData < ActiveRecord::Migration[4.2]
  def change
    create_table :place_type_data do |t|
      t.integer :place_type_id
      t.string :data_type
      t.float :score
      t.float :cost
      t.float :cost_multiplier
    end
  end
end
