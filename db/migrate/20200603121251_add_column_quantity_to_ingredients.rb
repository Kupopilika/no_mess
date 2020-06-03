class AddColumnQuantityToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :quantity, :integer
  end
end
