class CreateDateRestaurantZones < ActiveRecord::Migration[5.1]
  def up
    create_table :date_restaurant_zones do |t|
      t.belongs_to :delivery_date, index: true
      t.belongs_to :restaurant, index: true
      t.belongs_to :delivery_zone, index: true
      t.timestamps
    end
  end
  
  def down
    drop_table :date_restaurant_zones
  end
end
