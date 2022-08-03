require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'John', email: 'zolget86@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.new(name: 'Recipe 1', description: 'Description 1', preparation_time: 1, cooking_time: 1, public: true,user:@user)
    @recipe.save
  end
  
  it 'should be created' do
    expect(@recipe).to be_valid
  end

  it 'is not valid without a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a preparation_time' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'is not valid without a cooking_time' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

end
