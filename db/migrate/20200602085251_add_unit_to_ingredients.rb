class AddUnitToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :unit, :string
  end
end
