require_relative '../rails_helper'

RSpec.describe 'The page index page', type: :feature do
  describe 'after logging in' do
    before :each do
      @user1 = User.create!(name: 'Test User', email: 'test@testmail.com', password: '123456')

      @food1 = Food.create!(name: 'Test Food 1', measurement_unit: 'kg', price: 2, user_id: @user1.id, quantity: 1)

      @food2 = Food.create!(name: 'Test Food 2', measurement_unit: 'kg', price: 1, user_id: @user1.id, quantity: 1)

      visit 'users/sign_in'
      fill_in 'Email', with: 'test@testmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
    end

    it 'displays Food List in Nav Bar' do
      visit '/'
      expect(page).to have_content 'New'
    end

    it 'displays a list of all foods' do
      visit '/foods'
      expect(page).to have_content 'Test Food 1'
      expect(page).to have_content 'Test Food 2'
    end

    it 'has a button to create new food' do
      visit '/foods'
      expect(page).to have_content 'New'
    end

    it 'takes you to add food form when clicking add new food button' do
      visit '/foods'
      click_on 'New'
      expect(current_path).to eql '/foods/new'
    end
  end
end
