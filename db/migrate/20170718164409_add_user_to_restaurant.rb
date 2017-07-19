class AddUserToRestaurant < ActiveRecord::Migration[5.1]
  def up
    add_reference :restaurants, :user, index: true
  end
  
  def down
    remove_column :restaurants, :user_id
  end
end
