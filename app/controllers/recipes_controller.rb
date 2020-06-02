class RecipesController < ApplicationController
  before_action :set_last_recipe, only: :show

  def index
    @favorites = current_user.favorites
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


  def show

    if @recipe.difficulty_level == "très facile"
      (@difficulty_number = 1) && (@missing_circle = 3)
    elsif @recipe.difficulty_level == "facile"
      (@difficulty_number = 2) && (@missing_circle = 2)
    elsif @recipe.difficulty_level == "Niveau moyen"
      (@difficulty_number = 3) && (@missing_circle = 1)
    elsif @recipe.difficulty_level == "difficile"
      (@difficulty_number = 4) && (@missing_circle = 0)
    else
      (@difficulty_number = 0) && (@missing_circle = 0)
    end

    if @recipe.cooking_time
      @time_recipe = @recipe.preparation_time + @recipe.cooking_time
    else
      @time_recipe = @recipe.preparation_time
    end

    @user_ingredients = current_user.user_ingredients.order(:expiration_date)

  end

  private

  def set_last_recipe
    @recipe = Recipe.find(params[:id])
    cookies[:last_recipe_id] = @recipe.id
  end

end
