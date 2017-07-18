class CreateMeal < ActiveRecord::Migration[5.1]
  def up
    create_table :meals do |t|
      t.string :name
      t.decimal :price
      t.date :delivery_date
      t.belongs_to :restaurant, index: true
      t.timestamps
    end
  end
  
  def down
    drop_table :meals
  end
end
