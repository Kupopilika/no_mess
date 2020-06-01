class IngredientsController < ApplicationController
  def expiration
    render json: Ingredient.all.map { |ingredient| { ingredient.id => set_expiration(ingredient.category) } }
  end

  private

  def set_expiration(ingredient)
    case ingredient
    when "1"
      return 3
    when "2"
      return 5
    when "3"
      return 7
    when "4"
      return 10
    when "5"
      return 14
    when "6"
      return 21
    when "7"
      return 30
    when "8"
      return 99
    end
  end
end
