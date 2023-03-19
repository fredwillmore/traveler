class Place < ActiveRecord::Base
  belongs_to :location
  has_and_belongs_to_many :place_types

  delegate :lat, :lng, to: :location

  API_KEY = Rails.application.credentials[:googlemaps_api_key]

  def self.find_or_create_by_external_id_and_player_id(external_id, player_id)
    if external_id
      my_place = Place.find_or_create_by_external_id external_id
    else
      my_place = Place.find_or_create_by_player_id player_id
    end
  end

  def self.find_or_create_by_external_id(external_id)
    unless place = Place.find_by_external_id(external_id)
      spot = GooglePlaces::Client.new(API_KEY).spot(external_id)
      place = Place.new({
        external_id: external_id,
        name: spot.name,
        rating: spot.rating,
        location: Location.find_or_create_by(lat: spot.lat, lng: spot.lng)
      })
      spot.types.each do |t|
        place.place_types << PlaceType.find_or_create_by(name: t)
      end
      place.save!
    end
    place;
  end

  # TODO: implement these methods
  # I don't remember what I was trying to do here, but it's a mess
  # meanwhile, just providing stubbed data

  def food_cost
    10
  end

  def food_value
    12
  end

  def drink_cost
    9
  end

  def drink_value
    24
  end

  # COST_GRADE_1 = 2
  # VALUE_GRADE_1 = 2
  # COST_GRADE_2 = 4
  # VALUE_GRADE_2 = 4
  # COST_GRADE_3 = 6
  # VALUE_GRADE_3 = 6

  # FOOD_VALUE_MAX = 20
  # DRINK_VALUE_MAX = 10

  # attr_accessor :food_cost
  # attr_accessor :food_value
  # attr_accessor :drink_cost
  # attr_accessor :drink_value

  # def populate_secondary_data
  #   @food_cost=0
  #   @food_value=0
  #   @drink_cost=0
  #   @drink_value=0
  #   self.place_types.each { |place_type|
  #     place_type.place_type_data.each { |place_type_datum|
  #       case place_type_datum.data_type
  #         when 'food'
  #           case place_type.name
  #             when 'restaraunt'
  #               food_cost = COST_GRADE_3
  #               food_value = VALUE_GRADE_3
  #             when 'cafe'
  #               food_cost = COST_GRADE_2
  #               food_value = VALUE_GRADE_2
  #             when 'bar'
  #               food_cost = COST_GRADE_1
  #               food_value = VALUE_GRADE_1
  #             else
  #               food_cost = COST_GRADE_1
  #               food_value = VALUE_GRADE_1
  #           end
  #         when 'drink'
  #           case place_type.name
  #             when 'restaraunt'
  #               drink_cost = COST_GRADE_3
  #               drink_value = VALUE_GRADE_2
  #             when 'cafe'
  #               drink_cost = COST_GRADE_2
  #               drink_value = VALUE_GRADE_1
  #             when 'bar'
  #               drink_cost = COST_GRADE_2
  #               drink_value = VALUE_GRADE_3
  #             else
  #               drink_cost = COST_GRADE_1
  #               drink_value = VALUE_GRADE_1
  #           end
  #         else
  #       end
  #       if food_cost && (@food_cost < food_cost)
  #         @food_cost = food_cost
  #       end
  #       if food_value && (@food_value < food_value)
  #         @food_value = food_value
  #       end
  #       if drink_cost && (@drink_cost < drink_cost)
  #         @drink_cost = drink_cost
  #       end
  #       if drink_value && (@drink_value < drink_value)
  #         @drink_value = drink_value
  #       end
  #     }
  #     # modify base _costs and _values based on rating

  #   }
  #   self.food_cost = @food_cost
  #   self.food_value = @food_value
  #   self.drink_cost = @drink_cost
  #   self.drink_value = @drink_value
  # end

end
