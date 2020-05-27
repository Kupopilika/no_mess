class AddIngredientListToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredient_list, :string
  end
end
