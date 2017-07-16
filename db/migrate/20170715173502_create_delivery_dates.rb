class CreateDeliveryDates < ActiveRecord::Migration[5.1]
  def up
    create_table :delivery_dates do |t|
      t.date :delivery_date
      t.timestamps
    end
  end
  
  def down
    drop_table :delivery_dates
  end
  
end
