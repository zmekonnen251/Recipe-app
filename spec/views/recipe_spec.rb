require_relative '../rails_helper'

RSpec.describe 'The recipes index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @recipe1 = Recipe.create!(name: 'Test Recipe 1', description: 'test description 1', public: true,
                                preparation_time: 10, cooking_time: 10, user_id: @user1.id)

      @recipe2 = Recipe.create!(name: 'Test Recipe 2', description: 'test description 2', public: false,
                                preparation_time: 10, cooking_time: 10,
                                user_id: @user1.id)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'shows the title, description, preparation and cooking time' do
      visit '/recipes'
      expect(page).to have_content 'Test Recipe 1'
      expect(page).to have_content 'Test Recipe 2'
      expect(page).to have_content 'New'
      expect(page).to have_content 'New'
    end

    it 'shows a delete and add new recipe button' do
      visit '/recipes'
      expect(page).to have_content 'New'
      expect(page).to have_content 'New'
    end

    it 'takes you to recipe show page when clicking on recipe title' do
      visit '/recipes'
      click_on 'Recipe'
      expect(current_path).to eql "/recipes/#{@recipe1.id}"
    end

    it 'takes you to add recipe form when clicking on add recipe button' do
      visit '/recipes'
      click_on 'New'
      expect(current_path).to eql '/recipes/new'
    end
  end
end