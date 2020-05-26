class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.string :difficulty_level
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :image

      t.timestamps
    end
  end
end
