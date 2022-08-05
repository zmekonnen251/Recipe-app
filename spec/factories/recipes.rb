FactoryBot.define do
  factory :recipe do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    cooking_time { Faker::Number.between(1, 10) }
    preparation_time { Faker::Number.between(1, 10) }
    public { Faker::Boolean.boolean }
    user { FactoryBot.create(:user) }
  end
end
