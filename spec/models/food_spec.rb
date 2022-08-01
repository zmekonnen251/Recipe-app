require 'rails_helper'

RSpec.describe Food, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:user) }
  it { should have_many(:recipe_foods) }

  describe '#name' do
    it 'should be present' do
      food = Food.new
      food.valid?
      expect(food.errors[:name]).to include("can't be blank")
    end
  end
end
