FactoryBot.define do
  factory :food do
    name { Faker::Food.name}
    measurement_unit { 'kg' }
    price { Faker::Number.between(1, 10) }
    user { FactoryBot.create(:user) }
  end
end