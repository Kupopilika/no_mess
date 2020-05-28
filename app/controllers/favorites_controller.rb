class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = Favorite.new(recipe: @recipe, user: current_user)
    @favorite.save
    redirect_to recipes_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to recipes_path
  end

end
