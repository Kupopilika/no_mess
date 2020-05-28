class RecipesController < ApplicationController

  def show
    # @recipe = Recipe.find(params[:id])
  end

  def index
    @user_ingredients = UserIngredient.all.order(:expiration_date)
    if UserIngredient.count > 0
      @recipes = Recipe.where("name ILIKE ?", "%#{@user_ingredients.first.ingredient.name}%")
      if @recipes.count != 0
        @recipes = @recipes
      else
        @recipes = Recipe.all
      end
    else
      @recipes = Recipe.all
    end
  end
end
