# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Users = User.create([{
  id: '1',
  first_name: "Freddy",
  last_name: "McReddy",
  email: "fredwillmore@gmail.com"
}]);


Quantity.delete_all
Quantities = Quantity.create([
  { id: 1, name:"energy" },
  { id: 2, name:"food" },
  { id: 3, name:"water" },
  { id: 4, name:"hygiene" },
  { id: 5, name:"money" },
  { id: 6, name:"confidence" },
  { id: 7, name:"happiness" }
]);

Player.delete_all
Players = Player.create([{
  id: '1',
  user_id: '1',
  location_id: '1',
  level: '1',
  sex: 'M',
  dob: '1967-06-26',
  occupation: 'software guy',
  player_quantities: PlayerQuantity.create([
    { player_id: 1, quantity_id: 1, value: 95, max_value: 100 }, # energy
    { player_id: 1, quantity_id: 2, value: 90, max_value: 100 }, #  food
    { player_id: 1, quantity_id: 3, value: 85, max_value: 100 }, #  water
    { player_id: 1, quantity_id: 4, value: 80, max_value: 100 }, #  bio
    { player_id: 1, quantity_id: 5, value: 75, max_value: 100 }, #  money
    { player_id: 1, quantity_id: 6, value: 70, max_value: 100 }, #  confidence
    { player_id: 1, quantity_id: 7, value: 75, max_value: 100 } #  happiness
  ]),
  attractiveness: '65',
  charisma: '60',
  status: '55',
  intelligence: '50',
  luck: '45',
  base_locale: 'en', # I'm english
  target_locale: 'es' # trying to learn spanish
}]);

Location.delete_all
Locations = Location.create([{
  id: '1',
  lat: 45.516858,
  lng: -122.628558
}]);

Place.delete_all
Places = Place.create([{
  id: '1',
  location_id: '1',
  player_id: '1',
  name: 'the Launching Pad'
}]);

PlaceType.delete_all
PlaceTypes = PlaceType.create([
  { id: 1, name:  'accounting', label: 'Accounting' },
  { id: 2, name:  'airport', label: 'Airport' },
  { id: 3, name:  'amusement_park', label: 'Amusement Park' },
  { id: 4, name:  'aquarium', label: 'Aquarium' },
  { id: 5, name:  'art_gallery', label: 'Art Gallery' },
  { id: 6, name:  'atm', label: 'ATM' },
  { id: 7, name:  'bakery', label: 'Bakery' },
  { id: 8, name:  'bank', label: 'Bank' },
  { id: 9, name:  'bar', label: 'Bar', place_type_data: PlaceTypeDatum.create(
    [
      { data_type: 'food', score: 2, cost: 2, cost_multiplier: 1 },
      { data_type: 'drink', score: 6, cost: 4, cost_multiplier: 2 },
      { data_type: 'entertainment', score: 2, cost: 1, cost_multiplier: 1 }
    ]
  ) },
  { id: 10, name:  'beauty_salon', label: 'Beauty Salon' },
  { id: 11, name:  'bicycle_store', label: 'Bicycle Store' },
  { id: 12, name:  'book_store', label: 'Book Store' },
  { id: 13, name:  'bowling_alley', label: 'Bowling Alley' },
  { id: 14, name:  'bus_station', label: 'Bus Station' },
  { id: 15, name:  'cafe', label: 'Cafe', place_type_data: PlaceTypeDatum.create(
    [
      { data_type: 'food', score: 4, cost: 2, cost_multiplier: 1 },
      { data_type: 'drink', score: 2, cost: 4, cost_multiplier: 1 },
    ]
  ) },
  { id: 16, name:  'campground', label: 'Campground' },
  { id: 17, name:  'car_dealer', label: 'Car Dealer' },
  { id: 18, name:  'car_rental', label: 'Car Rental' },
  { id: 19, name:  'car_repair', label: 'Car Repair' },
  { id: 20, name:  'car_wash', label: 'Car Wash' },
  { id: 21, name:  'casino', label: 'Casino' },
  { id: 22, name:  'cemetery', label: 'Cemetery' },
  { id: 23, name:  'church', label: 'Church' },
  { id: 24, name:  'city_hall', label: 'City Hall' },
  { id: 25, name:  'clothing_store', label: 'Clothing Store' },
  { id: 26, name:  'convenience_store', label: 'Convenience Store' },
  { id: 27, name:  'courthouse', label: 'Courthouse' },
  { id: 28, name:  'dentist', label: 'Dentist' },
  { id: 29, name:  'department_store', label: 'Department Store' },
  { id: 30, name:  'doctor', label: 'Doctor' },
  { id: 31, name:  'electrician', label: 'Electrician' },
  { id: 32, name:  'electronics_store', label: 'Electronics Store' },
  { id: 33, name:  'embassy', label: 'Embassy' },
  { id: 34, name:  'establishment', label: 'Establishment' },
  { id: 35, name:  'finance', label: 'Finance' },
  { id: 36, name:  'fire_station', label: 'Fire Station' },
  { id: 37, name:  'florist', label: 'Florist' },
  { id: 38, name:  'food', label: 'Food' },
  { id: 39, name:  'funeral_home', label: 'Funeral Home' },
  { id: 40, name:  'furniture_store', label: 'Furniture Store' },
  { id: 41, name:  'gas_station', label: 'Gas Station' },
  { id: 42, name:  'general_contractor', label: 'General Contractor' },
  { id: 43, name:  'geocode', label: 'Geocode' },
  { id: 44, name:  'grocery_or_supermarket', label: 'Grocery or Supermarket' },
  { id: 45, name:  'gym', label: 'Gym' },
  { id: 46, name:  'hair_care', label: 'Hair Care' },
  { id: 47, name:  'hardware_store', label: 'Hardware Store' },
  { id: 48, name:  'health', label: 'Health' },
  { id: 49, name:  'hindu_temple', label: 'Hindu Temple' },
  { id: 50, name:  'home_goods_store', label: 'Home Goods Store' },
  { id: 51, name:  'hospital', label: 'Hospital' },
  { id: 52, name:  'insurance_agency', label: 'Insurance Agency' },
  { id: 53, name:  'jewelry_store', label: 'Jewelry Store' },
  { id: 54, name:  'laundry', label: 'Laundry' },
  { id: 55, name:  'lawyer', label: 'Lawyer' },
  { id: 56, name:  'library', label: 'Library' },
  { id: 57, name:  'liquor_store', label: 'Liquor Store' },
  { id: 58, name:  'local_government_office', label: 'Local Government Office' },
  { id: 59, name:  'locksmith', label: 'Locksmith' },
  { id: 60, name:  'lodging', label: 'Lodging' },
  { id: 61, name:  'meal_delivery', label: 'Meal Delivery' },
  { id: 62, name:  'meal_takeaway', label: 'Meal Takeaway' },
  { id: 63, name:  'mosque', label: 'Mosque' },
  { id: 64, name:  'movie_rental', label: 'Movie Rental' },
  { id: 65, name:  'movie_theater', label: 'Movie Theater' },
  { id: 66, name:  'moving_company', label: 'Moving Company' },
  { id: 67, name:  'museum', label: 'Museum' },
  { id: 68, name:  'night_club', label: 'Night Club' },
  { id: 69, name:  'painter', label: 'Painter' },
  { id: 70, name:  'park', label: 'Park' },
  { id: 71, name:  'parking', label: 'Parking' },
  { id: 72, name:  'pet_store', label: 'Pet Store' },
  { id: 73, name:  'pharmacy', label: 'Pharmacy' },
  { id: 74, name:  'physiotherapist', label: 'Physiotherapist' },
  { id: 75, name:  'place_of_worship', label: 'Place of Worship' },
  { id: 76, name:  'plumber', label: 'Plumber' },
  { id: 77, name:  'police', label: 'Police' },
  { id: 78, name:  'post_office', label: 'Post Office' },
  { id: 79, name:  'real_estate_agency', label: 'Real Estate Agency' },
  { id: 80, name:  'restaurant', label: 'Restaurant', place_type_data: PlaceTypeDatum.create(
    [
      { data_type: 'food', score: 6, cost: 2, cost_multiplier: 3 },
      { data_type: 'drink', score: 4, cost: 4, cost_multiplier: 2 },
      { data_type: 'entertainment', score: 2, cost: 0, cost_multiplier: 0 }
    ]
  ) },
  { id: 81, name:  'roofing_contractor', label: 'Roofing Contractor' },
  { id: 82, name:  'rv_park', label: 'RV Park' },
  { id: 83, name:  'school', label: 'School' },
  { id: 84, name:  'shoe_store', label: 'Shoe Store' },
  { id: 85, name:  'shopping_mall', label: 'Shopping Mall' },
  { id: 86, name:  'spa', label: 'Spa' },
  { id: 87, name:  'stadium', label: 'Stadium' },
  { id: 88, name:  'storage', label: 'Storage' },
  { id: 89, name:  'store', label: 'Store' },
  { id: 90, name:  'subway_station', label: 'Subway Station' },
  { id: 91, name:  'synagogue', label: 'Synagogue' },
  { id: 92, name:  'taxi_stand', label: 'Taxi Stand' },
  { id: 93, name:  'train_station', label: 'Train Station' },
  { id: 94, name:  'travel_agency', label: 'Travel Agency' },
  { id: 95, name:  'university', label: 'University' },
  { id: 96, name:  'veterinary_care', label: 'Veterinary Care' },
  { id: 97, name:  'zoo', label: 'Zoo' }
]);

PlaceTypeDatum.delete_all
PlaceTypeData = PlaceTypeDatum.create([
]);

Challenge.delete_all
CurriculumArea.delete_all
language_content = YAML.load_file(Rails.root.join('config/', 'load_content.yml'))

locales = language_content.keys - ['en']
english_content = language_content['en']

english_content.each_with_index {|ca, ca_index|
  I18n.locale = 'en'
  curriculum_area = CurriculumArea.create( { title: ca['curriculum_area'] } );
  level = english_content[ca_index]['level']
  locales.each { |locale|
    I18n.locale = locale
    curriculum_area.title = language_content[locale][ca_index]['curriculum_area']
    curriculum_area.save
  }
  english_content[ca_index]['challenges'].each_with_index {|ch, ch_index|
    I18n.locale = 'en'
    challenge = Challenge.create({ challenge_text: ch, curriculum_area_id: curriculum_area.id, level: level})
    locales.each { |locale|
      I18n.locale = locale
      challenge.challenge_text = language_content[locale][ca_index]['challenges'][ch_index]
      challenge.save
    }
  }
}
