class CreateDeliveryZone < ActiveRecord::Migration[5.1]
  def up
    create_table :delivery_zones do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def down
    drop_table :delivery_zones
  end
end
