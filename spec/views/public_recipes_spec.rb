require_relative '../rails_helper'

RSpec.describe 'The public recipes page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

    @recipe1 = Recipe.create!(name: 'Test Recipe 1', description: 'test decription 1',
                              public: true, preparation_time: 20.0, cooking_time: 40.0, user_id: @user1.id)

    @recipe2 = Recipe.create!(name: 'Test Recipe 2', description: 'test decription 2', public: false,
                              preparation_time: 20.0, cooking_time: 40.0, user_id: @user1.id)
  end

  it 'shows a list of all public recipes' do
    visit '/public_recipes'
    expect(page).to have_content 'My Recipes'
    expect(page).to have_content 'Test Recipe 1'
  end

  it 'does not allow visitors to delete a recipe' do
    visit '/public_recipes'
    expect(page).to_not have_content 'Delete'
  end

  it 'has a link to recipe show page' do
    visit '/public_recipes'
    click_on 'Test Recipe 1'
    expect(current_path).to eql "/recipes/#{@recipe1.id}"
  end
end
