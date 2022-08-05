require 'rails_helper'
require_relative '../support/device'

RSpec.describe Food, type: :model do
  describe 'validations' do
    food = FactoryBot.build(:food)

    it 'is valid with valid attributes' do
      expect(food).to be_valid
    end

    it 'is not not valid without a name' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a price' do
      food.price = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a user' do
      food.user = nil
      expect(food).to_not be_valid
    end

  end
end
