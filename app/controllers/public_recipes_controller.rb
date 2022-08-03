class PublicRecipesController < ApplicationController
  # load_and_authorize_resource
  # before_action :authenticate_user!

  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
