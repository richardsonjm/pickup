class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :firstname
      t.string :lastname
      t.string :auth_token, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
