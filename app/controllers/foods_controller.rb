class FoodsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @food = Food.all
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = Food.new(food_params)
    # @food.user_id = current_user.id

    if @food.save
      flash[:success] = 'Food created succesffully.'
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    flash[:success] = 'Food deleted.'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
