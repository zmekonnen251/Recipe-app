require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    @user = User.create(name:'test', email:'testemail@test.com', password:'testtest', password_confirmation:'testtest')
    @food = Food.create(name:'test', measurement_unit:'kg', price:1, user:@user)
    @recipe = Recipe.create(name:'test', description:'test', cooking_time:1, preparation_time:1, public:true, user:@user)
    recipe_food = RecipeFood.create(food:@food, recipe:@recipe, quantity:1)

    it 'is valid with valid attributes' do
      expect(recipe_food).to be_valid
    end

    it 'is not not valid without a recipe' do
      recipe_food.recipe = nil
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid without a food' do
      recipe_food.food = nil
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid without a quantity' do
      recipe_food.quantity = nil
      expect(recipe_food).to_not be_valid
    end
  end
end
