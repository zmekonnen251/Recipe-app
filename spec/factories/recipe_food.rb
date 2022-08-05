FactoryBot.define do
  factory :recipe_food do
    recipe { FactoryBot.create(:recipe) }
    food { FactoryBot.create(:food) }
    quantity { Faker::Number.between(1, 10) }
  end
end
