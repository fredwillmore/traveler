# FactoryGirl.define do
#   factory :admin do |f|
#     f.name Faker::Name.name
#     f.email Faker::Internet.email
#   end
# end

FactoryGirl.define do
  factory :action_type do |f|
    f.name "Physical"
  end

  factory :challenge_type do |f|
    f.name "Physical"
  end

  factory :challenge do |f|
    f.challenge_type_id 1
    f.curriculum_area_id 1
    f.level 1
  end

  factory :curriculum_area do |f|
    f.title "Greetings"
  end

  factory :item_type do |f|
    f.name "Amulet or something"
  end

  factory :item do |f|
    # f.name "Bag of balloons"
    f.item_type_id 1
    f.value 50
  end

  factory :location do |f|
    f.lat 99.99
    f.lng 88.88
  end

  factory :place_type do |f|
    f.name "School"
    f.label "School Foo"
  end

  factory :place do |f|
    f.external_id "ChIJD9ZJunsKlVQRM22Z262SgSk"
    f.player_id 1
    f.location_id 2
    f.rating 2.5
  end

  factory :player do |f|
    f.state           "normal"
    f.location_id     1
    f.level           2
    f.name            "Lahr"
    f.sex             "m"
    f.dob             Date.parse("1979-06-26")
    f.occupation      "screen printer"
    f.attractiveness  44
    f.charisma        33
    f.status          55
    f.intelligence    66
    f.luck            77
    f.base_locale     "en"
    f.target_locale   "es"
    f.target_dialect  "es"
  end

  factory :quantity do |f|
    f.name  "Extremeness"
    f.value "44"
  end

  factory :reward_type do |f|
    f.name  "Food"
  end

  factory :reward

  factory :user_action do |f|
    f.action_type_id 1
    f.reward_id      2
    f.risk_id        3
    f.challenge_id   4
  end

  factory :user do |f|
    f.first_name "Felix"
    f.last_name "Feelgood"
    f.email "xoxo@example.com"
    f.password "hello1234"
  end
end
