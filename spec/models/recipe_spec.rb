require 'rails_helper'
require_relative '../support/device'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    recipe = FactoryBot.build(:recipe)

    it 'is valid with valid attributes' do
      expect(recipe).to be_valid
    end

    it 'is not valid without a name' do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      recipe.description = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      recipe.cooking_time = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      recipe.preparation_time = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a public' do
      recipe.public = nil
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a user' do
      recipe.user = nil
      expect(recipe).to_not be_valid
    end
  end
end


