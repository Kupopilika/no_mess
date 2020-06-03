class IngredientsController < ApplicationController
  require 'open-uri'
  require 'json'

  skip_before_action :authenticate_user!, only: :expiration

  def expiration
    render json: Ingredient.all.map { |ingredient| { ingredient.id => set_expiration(ingredient.category) } }
  end

  def units
    render json: Ingredient.all.map { |ingredient| { ingredient.id => ingredient.unit } }
  end

  def create
      codebar = params[:ean].to_s
      ingredients = Ingredient.all
      result = ingredients.where(code: codebar)
      if result != []
        ingredient = result

      else
        url = "https://world.openfoodfacts.org/api/v0/product/#{codebar}.json"
        product_serialized = open(url).read
        element = JSON.parse(product_serialized)
        unit = element["product"]["quantity"].match(/\D+/).to_s.strip
        ingredient = Ingredient.create(name: element["product"]["product_name"], category: "all", image: element["product"]["image_url"], unit: unit, code: codebar)

      end
      render json: ingredient
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
