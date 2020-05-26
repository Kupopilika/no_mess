class Ingredient < ApplicationRecord
  has_many :user_ingredients, dependent: :destroy
  has_one_attached :photo
end
