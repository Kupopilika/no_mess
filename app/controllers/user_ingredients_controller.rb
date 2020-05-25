class UserIngredientsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user_ingredient = UserIngredient.new
  end

  def create
    @user_ingredient = UserIngredient.new(user_ingredients_params)
    @user = current_user.id
    @user_ingredient.user = @user
    if @user_ingredient.save
      redirect_to user_ingredients_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def user_ingredients_params
    params.require(:user_ingredient).permit(:quantity, :purchase_date, :expiration_date, :ingredient_id, :user_id)
  end
end
