FactoryBot.define do
  factory :user do
    first_name { "Felix" }
    last_name { "Feelgood" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "hello1234" }
  end
end
