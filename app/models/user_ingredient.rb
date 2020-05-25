class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  has_many :ingredients
end
