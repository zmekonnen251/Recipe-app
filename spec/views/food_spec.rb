require 'rails_helper'
require_relative '../support/device'

RSpec.describe 'The page index page', type: :feature do
  before :each do
    User.create!(name: 'test', email: 'test@testmail.com', password: '123456')
  end

  it 'After signing in, the food index page shows the food list' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@testmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Foods'
    expect(page).to have_content('Foods')
  end

  it 'After signing in, the add food page shows add food form' do
    visit '/users/sign_in'
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@testmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Add Food'
    expect(page).to have_content('Add Food')
  end
end
