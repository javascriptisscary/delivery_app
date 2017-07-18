class CreateRestaurant < ActiveRecord::Migration[5.1]
  def up
    create_table :restaurants do |t|
      t.string :name
      t.belongs_to :delivery_zone, index: true
      t.timestamps
    end
  end
  
  def down
    drop_table :restaurants
  end
end
