class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity

      t.timestamps
    end

    # add_index :recipe_foods, [:recipe_id, :food_id], unique: true
  end
end
