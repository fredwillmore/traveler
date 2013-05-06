class Place < ActiveRecord::Base
  has_one :location
  has_and_belongs_to_many :place_types

  API_KEY = 'AIzaSyBd2SvRNu_Lf48wvjh7MQZsNisYfi6ae_s'
  YWSID = 'eVO1YSwv3rgJVEfoap8TDQ'

  COST_GRADE_1 = 2;
  VALUE_GRADE_1 = 2;
  COST_GRADE_2 = 4;
  VALUE_GRADE_2 = 4;
  COST_GRADE_3 = 6;
  VALUE_GRADE_3 = 6;

  FOOD_VALUE_MAX = 20;
  DRINK_VALUE_MAX = 10;

  attr_accessor :food_cost
  attr_accessor :food_value
  attr_accessor :drink_cost
  attr_accessor :drink_value

  # render json: init, methods: [:food_cost]

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

      # get additional info from Yelp, if available and appropriate
      # actually, it looks like the thing I really want, price range, is not given by Yelp API
      # so I'm putting this on the shelf for now.
      # There is still good stuff in here so maybe I'll come back to it
      # if my_spot.types & ['bar', 'restaurant', 'club', 'cafe'] # to be continued
      #   yelp_client = Yelp::Client.new
      #   yelp_request = Yelp::Review::Request::GeoPoint.new(
      #       :latitude => my_spot.lat,
      #       :longitude => my_spot.lng,
      #       :radius => '.001',
      #       :yws_id => YWSID)
      #   yelp_response = yelp_client.search(yelp_request)
      # end

      my_location = Location.find_or_create_by_lat_and_lng( my_spot.lat, my_spot.lng )

      my_place = Place.new
      my_place.external_id = external_id
      my_place.name = my_spot.name
      my_place.rating = my_spot.rating
      my_place.location_id = my_location.id
      my_spot.types.each do |place_type|
#        my_place_type = PlaceType::find_by_name place_type
        my_place.place_types << PlaceType::find_by_name(place_type)
      end

      my_place.save
    end
    return my_place;
  end

  def populate_secondary_data
    @food_cost=0
    @food_value=0
    @drink_cost=0
    @drink_value=0
    self.place_types.each { |place_type|
      place_type.place_type_data.each { |place_type_datum|
        case place_type_datum.data_type
          when 'food'
            case place_type.name
              when 'restaraunt'
                food_cost = COST_GRADE_3
                food_value = VALUE_GRADE_3
              when 'cafe'
                food_cost = COST_GRADE_2
                food_value = VALUE_GRADE_2
              when 'bar'
                food_cost = COST_GRADE_1
                food_value = VALUE_GRADE_1
              else
                food_cost = COST_GRADE_1
                food_value = VALUE_GRADE_1
            end
          when 'drink'
            case place_type.name
              when 'restaraunt'
                drink_cost = COST_GRADE_3
                drink_value = VALUE_GRADE_2
              when 'cafe'
                drink_cost = COST_GRADE_2
                drink_value = VALUE_GRADE_1
              when 'bar'
                drink_cost = COST_GRADE_2
                drink_value = VALUE_GRADE_3
              else
                drink_cost = COST_GRADE_1
                drink_value = VALUE_GRADE_1
            end
          else
        end
        if food_cost && (@food_cost < food_cost)
          @food_cost = food_cost
        end
        if food_value && (@food_value < food_value)
          @food_value = food_value
        end
        if drink_cost && (@drink_cost < drink_cost)
          @drink_cost = drink_cost
        end
        if drink_value && (@drink_value < drink_value)
          @drink_value = drink_value
        end
      }
      # modify base _costs and _values based on rating

    }
    self.food_cost = @food_cost
    self.food_value = @food_value
    self.drink_cost = @drink_cost
    self.drink_value = @drink_value
  end

end
