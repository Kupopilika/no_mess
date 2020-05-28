class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    @favorites = current_user.favorites
  end


end
