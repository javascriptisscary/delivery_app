class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :name
      t.string :token
      t.string :email
      t.string :password_digest
      t.integer :is_admin

      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
  
end
