class ChangeColumnCodeToIngredients < ActiveRecord::Migration[6.0]
  def change
    change_column :ingredients, :code, :string
  end
end
