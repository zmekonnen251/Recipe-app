class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:success] = 'Recipe created succesffully.'
      redirect_to recipes_path
    else
      puts 'Hello from create else'
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    puts '#############################################3'
    puts @recipe.name
    if @recipe.destroy
      flash[:success] = 'Recipe deleted.'
    else
      flash[:danger] = 'Recipe could not be deleted.'
    end
    redirect_to recipe_path
  end

  def update
    puts '#############################################3'
    @recipe = Recipe.find_by(id: params[:id])
    
    if @recipe.update(recipe_params)
      puts @recipe.public?
      puts @recipe.update(recipe_params) ? 'Recipe updated succesffully.' : 'Recipe could not be updated.'
      flash[:success] = 'Recipe updated succesffully.'
      redirect_to recipe_path
    else
      render 'show'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
