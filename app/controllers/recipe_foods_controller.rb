class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id].to_i)
    @food = Food.find_by(id: params[:recipe_food][:food_id].to_i)
    @quantity = params[:recipe_food][:quantity].to_i
  
    @new_recipe_food = RecipeFood.new(recipe:@recipe, food:@food, quantity:@quantity)
    

    if @new_recipe_food.save
      flash[:success] = 'RecipeFood created succesffully.'
      redirect_to recipe_path(@new_recipe_food.recipe)
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
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find_by(id: params[:id])
  
    if @recipe_food.update(recipe_food_params)
      flash[:success] = 'Ingredient updated succesffully.'
      redirect_to recipe_path(@recipe_food.recipe)
    else
      flash[:danger] = 'Ingredient could not be updated.'
      render 'edit'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end
end
