class UserIngredientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new ]

  def index
    @user_ingredients = UserIngredient.all.order(expiration_date: :desc)
    @ingredient = Ingredient.all
  end

  def show
  end

  def new
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
  end

  def delete
  end

  private

  def user_ingredients_params
    params.require(:user_ingredient).permit(:quantity, :purchase_date, :expiration_date, :ingredient_id, :user_id)
  end
end
