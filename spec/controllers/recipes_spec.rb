require 'rails_helper'
require_relative '../support/device'

  RSpec.describe RecipesController, type: :controller do
  
    login_user
 
    describe 'GET /index' do
      it 'renders a successful response' do
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        recipe = FactoryBot.create(:recipe)
        get :show, params: { id: recipe.id }
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'renders a successful response' do
        get :new
        expect(response).to be_successful
      end
    end

  

    describe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new Recipe' do
          expect do
            post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
          end.to change(Recipe, :count).by(1)
        end

        it 'redirects to the recipes list page' do
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
          expect(response).to redirect_to(recipes_url)
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Recipe' do
          expect do
            post :create, params: { recipe: FactoryBot.attributes_for(:recipe, name: nil) }
          end.to change(Recipe, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe, name: nil) }
          expect(response).to be_successful
        end
      end
    end

    describe 'Create and Update' do
      login_user
      
      it 'creates and updates a recipe' do
        expect do
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
          expect(response).to redirect_to(recipes_url)
          get :show, params: { id: Recipe.last.id }
          expect(response).to be_successful
          patch :update, params: { id: Recipe.last.id, recipe: FactoryBot.attributes_for(:recipe, name: 'Updated Recipe') }
          expect(response).to redirect_to(recipe_url)
          get :show, params: { id: Recipe.last.id }
          expect(response).to be_successful
        end.to change(Recipe, :count).by(1)
      end
    end


end

