FactoryBot.define do
  factory :authentication_token do
    token { "MyString" }
    user { nil }
    expires_at { "2016-12-03 12:20:13" }
  end
end
