class CreateZone < ActiveRecord::Migration[5.1]
  def up
    create_table :zones do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def down
    drop_table :zones
  end
end
