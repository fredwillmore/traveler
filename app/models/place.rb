class Place < ActiveRecord::Base
  has_one :location
  has_and_belongs_to_many :place_types
  API_KEY = 'AIzaSyBd2SvRNu_Lf48wvjh7MQZsNisYfi6ae_s'

  def self.find_or_create_by_external_id_and_player_id(external_id, player_id)
    if external_id
      my_place = Place.find_or_create_by_external_id external_id
    else
      my_place = Place.find_or_create_by_player_id player_id
    end
  end

  def self.find_or_create_by_external_id (external_id)
    my_place = Place.find_by_external_id external_id
    if !my_place
      google_places_client = GooglePlaces::Client.new(API_KEY)
      my_spot = google_places_client.spot(external_id)

      my_location = Location.find_or_create_by_lat_and_lng( my_spot.lat, my_spot.lng )

      my_place = Place.new
      my_place.external_id = external_id
      my_place.name = my_spot.name
      my_place.location_id = my_location.id
      my_spot.types.each do |place_type|
#        my_place_type = PlaceType::find_by_name place_type
        my_place.place_types << PlaceType::find_by_name(place_type)
      end

      my_place.save
    end
    return my_place;
  end

end
