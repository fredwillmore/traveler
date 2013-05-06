class CreatePlaceTypes < ActiveRecord::Migration
  def self.up
    create_table :place_types do |t|
      t.string  :name
      t.string  :label
      t.timestamps
    end
    PlaceType.create_translation_table! :label => :string
  end
  def self.down
    drop_table :place_types
    PlaceType.drop_translation_table!
  end
end
