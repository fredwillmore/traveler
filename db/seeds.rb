# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  User.delete_all
  user = User.create(
    first_name: "Freddy",
    last_name: "McReddy",
    email: "fredwillmore@gmail.com",
    password: "!welcome"
  )

  Location.delete_all
  location = Location.create(
    lat: 45.516858,
    lng: -122.628558
  )

  Quantity.delete_all
  Quantity.create([
    { name: "energy" },
    { name: "food" },
    { name: "water" },
    { name: "hygiene" },
    { name: "money" },
    { name: "confidence" },
    { name: "happiness" }
  ])

  Player.delete_all
  player_1 = Player.create({
    user: user,
    location: location,
    level: '1',
    name: 'Fizznuckle',
    gender: 'M',
    dob: '1967-06-26',
    occupation: 'software guy',
    player_quantities: [
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "energy" }), value: 95, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "food" }), value: 90, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "water" }), value: 85, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "hygiene" }), value: 80, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "money" }), value: 75, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "confidence" }), value: 70, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "happiness" }), value: 75, max_value: 100 })
    ],
    attractiveness: '65',
    charisma: '60',
    status: '55',
    intelligence: '50',
    luck: '45',
    base_locale: 'en', # I'm english
    target_locale: 'es', # trying to learn spanish
    target_dialect: 'ES',
    is_current_player: true,
    avatar: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.application.root + "db/avatars/IMG_2753.jpg").to_io,
      filename: "IMG_2753.jpg"
    )
  })

  Player.create({
    user: user,
    location: location,
    level: '1',
    name: 'Fizznucklois',
    gender: 'M',
    dob: '1967-06-26',
    occupation: 'software guy',
    player_quantities: [
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "energy" }), value: 95, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "food" }), value: 90, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "water" }), value: 85, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "hygiene" }), value: 80, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "money" }), value: 75, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "confidence" }), value: 70, max_value: 100 }),
      PlayerQuantity.new({ quantity: Quantity.find_or_create_by({ name: "happiness" }), value: 75, max_value: 100 })
    ],
    attractiveness: '65',
    charisma: '60',
    status: '55',
    intelligence: '50',
    luck: '45',
    base_locale: 'en', # I'm english
    target_locale: 'fr', # trying to learn french
    target_dialect: 'FR',
    is_current_player: true,
    avatar: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.application.root + "db/avatars/IMG_2775.jpg").to_io,
      filename: "IMG_2775.jpg"
    )
  })

  Place.delete_all
  place = Place.create([{
    location: location,
    # player: player_1,
    name: 'the Launching Pad'
  }]);

  PlaceType.delete_all
  PlaceTypeDatum.delete_all
  PlaceType.create([
    { name: 'accounting', label: 'Accounting' },
    { name: 'airport', label: 'Airport' },
    { name: 'amusement_park', label: 'Amusement Park' },
    { name: 'aquarium', label: 'Aquarium' },
    { name: 'art_gallery', label: 'Art Gallery' },
    { name: 'atm', label: 'ATM' },
    { name: 'bakery', label: 'Bakery' },
    { name: 'bank', label: 'Bank' },
    {
      name: 'bar',
      label: 'Bar',
      place_type_data: [
        PlaceTypeDatum.new({ data_type: 'food', score: 2, cost: 2, cost_multiplier: 1 }),
        PlaceTypeDatum.new({ data_type: 'drink', score: 6, cost: 4, cost_multiplier: 2 }),
        PlaceTypeDatum.new({ data_type: 'entertainment', score: 2, cost: 1, cost_multiplier: 1 })
      ]
    },
    { name: 'beauty_salon', label: 'Beauty Salon' },
    { name: 'bicycle_store', label: 'Bicycle Store' },
    { name: 'book_store', label: 'Book Store' },
    { name: 'bowling_alley', label: 'Bowling Alley' },
    { name: 'bus_station', label: 'Bus Station' },
    {
      name: 'cafe',
      label: 'Cafe',
      place_type_data: [
        PlaceTypeDatum.new({ data_type: 'food', score: 4, cost: 2, cost_multiplier: 1 }),
        PlaceTypeDatum.new({ data_type: 'drink', score: 2, cost: 4, cost_multiplier: 1 }),
      ]
    },
    { name: 'campground', label: 'Campground' },
    { name: 'car_dealer', label: 'Car Dealer' },
    { name: 'car_rental', label: 'Car Rental' },
    { name: 'car_repair', label: 'Car Repair' },
    { name: 'car_wash', label: 'Car Wash' },
    { name: 'casino', label: 'Casino' },
    { name: 'cemetery', label: 'Cemetery' },
    { name: 'church', label: 'Church' },
    { name: 'city_hall', label: 'City Hall' },
    { name: 'clothing_store', label: 'Clothing Store' },
    { name: 'convenience_store', label: 'Convenience Store' },
    { name: 'courthouse', label: 'Courthouse' },
    { name: 'dentist', label: 'Dentist' },
    { name: 'department_store', label: 'Department Store' },
    { name: 'doctor', label: 'Doctor' },
    { name: 'electrician', label: 'Electrician' },
    { name: 'electronics_store', label: 'Electronics Store' },
    { name: 'embassy', label: 'Embassy' },
    { name: 'establishment', label: 'Establishment' },
    { name: 'finance', label: 'Finance' },
    { name: 'fire_station', label: 'Fire Station' },
    { name: 'florist', label: 'Florist' },
    { name: 'food', label: 'Food' },
    { name: 'funeral_home', label: 'Funeral Home' },
    { name: 'furniture_store', label: 'Furniture Store' },
    { name: 'gas_station', label: 'Gas Station' },
    { name: 'general_contractor', label: 'General Contractor' },
    { name: 'geocode', label: 'Geocode' },
    { name: 'grocery_or_supermarket', label: 'Grocery or Supermarket' },
    { name: 'gym', label: 'Gym' },
    { name: 'hair_care', label: 'Hair Care' },
    { name: 'hardware_store', label: 'Hardware Store' },
    { name: 'health', label: 'Health' },
    { name: 'hindu_temple', label: 'Hindu Temple' },
    { name: 'home_goods_store', label: 'Home Goods Store' },
    { name: 'hospital', label: 'Hospital' },
    { name: 'insurance_agency', label: 'Insurance Agency' },
    { name: 'jewelry_store', label: 'Jewelry Store' },
    { name: 'laundry', label: 'Laundry' },
    { name: 'lawyer', label: 'Lawyer' },
    { name: 'library', label: 'Library' },
    { name: 'liquor_store', label: 'Liquor Store' },
    { name: 'local_government_office', label: 'Local Government Office' },
    { name: 'locksmith', label: 'Locksmith' },
    { name: 'lodging', label: 'Lodging' },
    { name: 'meal_delivery', label: 'Meal Delivery' },
    { name: 'meal_takeaway', label: 'Meal Takeaway' },
    { name: 'mosque', label: 'Mosque' },
    { name: 'movie_rental', label: 'Movie Rental' },
    { name: 'movie_theater', label: 'Movie Theater' },
    { name: 'moving_company', label: 'Moving Company' },
    { name: 'museum', label: 'Museum' },
    { name: 'night_club', label: 'Night Club' },
    { name: 'painter', label: 'Painter' },
    { name: 'park', label: 'Park' },
    { name: 'parking', label: 'Parking' },
    { name: 'pet_store', label: 'Pet Store' },
    { name: 'pharmacy', label: 'Pharmacy' },
    { name: 'physiotherapist', label: 'Physiotherapist' },
    { name: 'place_of_worship', label: 'Place of Worship' },
    { name: 'plumber', label: 'Plumber' },
    { name: 'police', label: 'Police' },
    { name: 'post_office', label: 'Post Office' },
    { name: 'real_estate_agency', label: 'Real Estate Agency' },
    {
      name: 'restaurant',
      label: 'Restaurant',
      place_type_data: [
        PlaceTypeDatum.new({ data_type: 'food', score: 6, cost: 2, cost_multiplier: 3 }),
        PlaceTypeDatum.new({ data_type: 'drink', score: 4, cost: 4, cost_multiplier: 2 }),
        PlaceTypeDatum.new({ data_type: 'entertainment', score: 2, cost: 0, cost_multiplier: 0 })
      ]
    },
    { name: 'roofing_contractor', label: 'Roofing Contractor' },
    { name: 'rv_park', label: 'RV Park' },
    { name: 'school', label: 'School' },
    { name: 'shoe_store', label: 'Shoe Store' },
    { name: 'shopping_mall', label: 'Shopping Mall' },
    { name: 'spa', label: 'Spa' },
    { name: 'stadium', label: 'Stadium' },
    { name: 'storage', label: 'Storage' },
    { name: 'store', label: 'Store' },
    { name: 'subway_station', label: 'Subway Station' },
    { name: 'synagogue', label: 'Synagogue' },
    { name: 'taxi_stand', label: 'Taxi Stand' },
    { name: 'train_station', label: 'Train Station' },
    { name: 'travel_agency', label: 'Travel Agency' },
    { name: 'university', label: 'University' },
    { name: 'veterinary_care', label: 'Veterinary Care' },
    { name: 'zoo', label: 'Zoo' }
  ]);

  SearchSuggestion.delete_all
  PlaceType.all.map(&:label).each do |t|
    SearchSuggestion.create term: t.downcase, popularity: rand(1..100)
  end

  PlaceTypeDatum.delete_all
  PlaceTypeDatum.create([
  ]);

  Challenge.delete_all
  CurriculumArea.delete_all
  language_content = YAML.load_file(Rails.root.join('config/', 'load_content.yml'))

  locales = language_content.keys - ['en']
  english_content = language_content['en']

  # english_content.each_with_index {|ca, ca_index|
  #   I18n.locale = 'en'
  #   curriculum_area = CurriculumArea.create( { title: ca['curriculum_area'] } );
  #   level = english_content[ca_index]['level']
  #   locales.each { |locale|
  #     I18n.locale = locale
  #     curriculum_area.title = language_content[locale][ca_index]['curriculum_area']
  #     curriculum_area.save
  #   }
  #   english_content[ca_index]['challenges'].each_with_index {|ch, ch_index|
  #     I18n.locale = 'en'
  #     challenge = Challenge.create({ challenge_text: ch, curriculum_area_id: curriculum_area.id, level: level})
  #     locales.each { |locale|
  #       I18n.locale = locale
  #       challenge.challenge_text = language_content[locale][ca_index]['challenges'][ch_index]
  #       challenge.save
  #     }
  #   }
  # }
end