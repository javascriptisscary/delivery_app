class CreateRestaurantZone < ActiveRecord::Migration[5.1]
  def up
    create_table :restaurant_zones do |t|
      t.date :delivery_date
      t.belongs_to :restaurant, index: true
      t.belongs_to :zone, index: true
      
      t.timestamps
    end
    
    def down
      drop_table :restaurant_zones
    end
  end
end
