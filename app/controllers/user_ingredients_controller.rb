class UserIngredientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new ]
  before_action :set_user_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @user_ingredients = current_user.user_ingredients.where("quantity > 0").order(:expiration_date)
    @ingredient = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.find(params[:ingredient_id]) if params[:ingredient_id].present?
    @user_ingredient = UserIngredient.new
  end

  def create
    @user_ingredient = UserIngredient.new(user_ingredients_params)
    @user_ingredient.user = current_user
    if @user_ingredient.save
      redirect_to user_ingredients_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user_ingredient.update(user_ingredients_params)
    @user_ingredient.destroy if @user_ingredient.quantity <= 0
    redirect_to user_ingredients_path
  end

  def destroy
    @user_ingredient.destroy
    redirect_to user_ingredients_path
  end

  def product

  end

  private

  def set_user_ingredient
    @user_ingredient = UserIngredient.find(params[:id])
  end

  def user_ingredients_params
    params.require(:user_ingredient).permit(:quantity, :purchase_date, :expiration_date, :ingredient_id, :user_id)
  end
end
