class Location < ActiveRecord::Base
  has_one :place
  has_one :player

  def to_s
    "Lat: #{lat} Lng: #{lng}"
  end
end
