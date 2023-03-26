# FactoryBot.define do
#   factory :admin do |f|
#     f.name Faker::Name.name
#     f.email Faker::Internet.email
#   end
# end

FactoryBot.define do
  factory :action_type do
    name { "Physical" }
  end

  factory :challenge_type do
    name { "Physical" }
  end

  factory :challenge do
    challenge_type_id { 1 }
    curriculum_area_id { 1 }
    level { 1 }
  end

  factory :curriculum_area do
    title { "Greetings" }
  end

  factory :item_type do
    name { "Amulet or something" }
  end

  factory :item do
    # name "Bag of balloons"
    item_type_id { 1 }
    value { 50 }
  end

  factory :location do
    lat { 99.99 }
    lng { 88.88 }
  end

  factory :place_type do
    name { "School" }
    label { "School Foo" }
  end

  factory :place do
    external_id { "ChIJD9ZJunsKlVQRM22Z262SgSk" }
    location
    rating { 2.5 }
  end

  factory :player do
    user
    state           { "normal" }
    location_id     { 1 }
    level           { 2 }
    name            { "Lahr" }
    gender          { "nonbinary" }
    dob             { Date.parse("1979-06-26") }
    occupation      { "screen printer" }
    attractiveness  { 44 }
    charisma        { 33 }
    status          { 55 }
    intelligence    { 66 }
    luck            { 77 }
    base_locale     { "en" }
    target_locale   { "es" }
    target_dialect  { "es" }
    avatar {
      ActiveStorage::Blob.create_and_upload!(
        io: File.open(Rails.application.root + "spec/fixtures/files/test_image.jpg"),
        filename: 'test file'
      )
    }
  end

  factory :quantity do
    name  { "Extremeness" }
    value { "44" }
  end

  factory :reward_type do
    name  { "Food" }
  end

  factory :reward

  factory :user_action do
    action_type_id { 1 }
    reward_id      { 2 }
    risk_id        { 3 }
    challenge_id   { 4 }
  end

  factory :user do
    first_name { "Felix" }
    last_name { "Feelgood" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "hello1234" }
  end
end
