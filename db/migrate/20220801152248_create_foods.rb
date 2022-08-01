class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false, unique: true
      t.string :measurement_unit, null: false, default: 'g'
      t.float :price, null: false, default: 0.0
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end

    add_index :foods, :name, unique: true
    
  end
end
