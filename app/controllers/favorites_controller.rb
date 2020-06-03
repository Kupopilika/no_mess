class FavoritesController < ApplicationController

  def index
    if params[:query].present?
      @favorites = Favorite.joins(:recipe).where("recipes.name ILIKE ? AND user_id = #{current_user.id}", "%#{params[:query]}%")
    else
      @favorites = current_user.favorites
    end
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
    redirect_to favorites_path
  end

end
