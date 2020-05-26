class Ingredient < ApplicationRecord
  has_many :user_ingredients
  has_one_attached :photo
end
