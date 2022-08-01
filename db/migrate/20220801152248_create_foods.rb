class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.float :price
      t.integer :quantity

      t.timestamps
    end

    add_index :foods, :name, unique: true
    
  end
end
