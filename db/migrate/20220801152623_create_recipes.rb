class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :prepartion_time
      t.string :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps
    end

    add_index :recipes, :name, unique: true
  end
end
