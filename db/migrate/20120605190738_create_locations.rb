class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :lat, :precision => 10, :scale => 7
      t.decimal :long, :precision => 10, :scale => 7

      t.timestamps
    end
  end
end
