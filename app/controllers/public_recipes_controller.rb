class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    recipe_test = Recipe.find(params[:id])
    unless recipe_test.user == current_user || recipe_test.public?
      flash[:danger] = 'You do not have access to see details.'
      return redirect_to recipes_path
    end

    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes(:food).all.where(recipe_id: @recipe)
  end

  def create
    recipe = Recipe.create(recipe_params)
    recipe.user = current_user

    if recipe.save
      flash[:success] = 'New Recipe was successfully added.'
      redirect_to recipes_path
    else
      flash[:danger] = 'New Recipe adding Failed. Please try again.'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if current_user == recipe.user
      recipe.destroy
      flash[:success] = 'Recipe was successfully removed.'
    else
      flash[:danger] = 'The selected recipe belongs to another user'
    end
    redirect_to recipes_path
  end

  def public
    @totals = {}
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
    @public_recipes.each do |pub|
      total = 0
      RecipeFood.where(recipe_id: pub.id).each do |rec_food|
        total += rec_food.quantity * rec_food.food.price
      end
      @totals[pub.name] = total
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :public, :description)
  end
end
