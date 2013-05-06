class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string  :name
      t.string  :external_id
      t.integer :player_id
      t.integer :location_id
      t.float   :rating

      t.timestamps
    end
  end
end
