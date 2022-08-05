require 'rails_helper'

RSpec.describe 'The recipes index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @recipe1 = Recipe.create!(name: 'Test Recipe 1', description: 'test description 1', public: true,
                                preparation_time: 10, cooking_time: 10, user_id: @user1.id)

      @recipe2 = Recipe.create!(name: 'Test Recipe 2', description: 'test description 2', public: false,
                                preparation_time: 10, cooking_time: 10,
                                user_id: @user1.id)

    end

    it 'shows the title, description, preparation and cooking time' do
      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      click_on 'Recipes'

      expect(page).to have_content 'Test Recipe 1'
      expect(page).to have_content 'Test Recipe 2'
      expect(page).to have_content 'test description 1'
      expect(page).to have_button 'Remove'
      expect(page).to have_content 'New recipe'
      click_on 'New Recipe'
      expect(current_path).to eql '/recipes/new'
    end
  end
end
