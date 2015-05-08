class Location < ActiveRecord::Base
  has_one :place
  has_many :players
  has_many :players, as: :destination, foreign_key: 'destination_id'

  def to_s
    "Lat: #{lat} Lng: #{lng}"
  end
end
