class PlaceType < ActiveRecord::Base
  has_and_belongs_to_many :places
  has_many :place_type_data
  # translates :label
end
