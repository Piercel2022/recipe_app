class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.new(food_params)

    if food.save
      flash[:success] = 'New Food was successfully added.'
      redirect_to foods_path
    else
      flash[:danger] = 'New Food adding Failed. Please try again.'
    end
  end

  def edit
    @food = current_user.foods.find(params[:id])
  end

  def update
    @food = current_user.foods.find(params[:id])
    if @food.update(food_params)
      flash[:success] = 'Food was successfully updated.'
      redirect_to foods_path
    else
      flash[:danger] = 'Food updating Failed. Please try again.'
    end
  end

  def destroy
    food = Food.find(params[:id])
    if current_user == food.user
      food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:danger] = 'You cant delete food that belongs to other users'
    end
    redirect_to root_path
  end

  def general
    @foods = current_user.foods
    current_user.recipes.map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = recipe_food.food
        test = @foods.select { |f| f.name == food.name }[0]
        test.quantity = test.quantity - recipe_food.quantity
      end
    end
    @foods = @foods.select { |f| f.quantity.negative? }
    @foods.each { |f| f.quantity *= -1 }
    @total = 0
    @foods.each do |food|
      @total += (food.price * food.quantity)
    end
  end

  def food_params
    params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
  end
end