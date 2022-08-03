class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_food.food = Food.find_by(id: params[:food_id])
    if @recipe_food.save
      flash[:success] = 'RecipeFood created succesffully.'
      redirect_to recipe_path(@recipe_food.recipe)
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find_by(id: params[:id])
    if @recipe_food.destroy
      flash[:success] = 'RecipeFood deleted.'
    else
      flash[:danger] = 'RecipeFood could not be deleted.'
    end
    redirect_to recipe_path(@recipe_food.recipe)
  end

  def edit
    @recipe_food = RecipeFood.find_by(id: params[:id])
  end

  def update
    @recipe_food = RecipeFood.find_by(id: params[:id])
    if @recipe_food.update(recipe_food_params)
      flash[:success] = 'RecipeFood updated succesffully.'
      redirect_to recipe_path(@recipe_food.recipe)
    else
      render 'edit'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food, :recipe)
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end
end
