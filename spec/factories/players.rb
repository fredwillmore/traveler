FactoryBot.define do
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
end
