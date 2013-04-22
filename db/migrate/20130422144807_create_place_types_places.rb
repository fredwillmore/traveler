class CreatePlaceTypesPlaces < ActiveRecord::Migration
  def change
    create_table :place_types_places, :id => false do |t|
      t.integer :place_id
      t.integer :place_type_id
    end
  end
end
