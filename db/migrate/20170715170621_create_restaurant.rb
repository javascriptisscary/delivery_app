class CreateRestaurant < ActiveRecord::Migration[5.1]
  def up
    create_table :restaurants do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def down
    drop_table :restaurants
  end
  
end
