require 'rails_helper'
require_relative '../support/device'

RSpec.describe 'FoodsController', type: :controller do
  login_user
  describe 'GET #index' do
    it 'renders a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'renders a successful response' do
      food = FactoryBot.create(:food)
      get :show, params: { id: food.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'renders a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'renders a successful response' do
      food = FactoryBot.create(:food)
      get :edit, params: { id: food.id }
      expect(response).to be_successful
    end
  end
end