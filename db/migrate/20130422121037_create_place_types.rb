class CreatePlaceTypes < ActiveRecord::Migration
  def change
    create_table :place_types do |t|
      t.string  :name
      t.string  :label
      t.timestamps
    end
  end
end
