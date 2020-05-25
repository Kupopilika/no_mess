class UserIngredientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @user_ingredients = UserIngredient.all
    @ingredient = Ingredient.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
