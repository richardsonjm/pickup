class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end

    add_index :games, :name, unique: true
  end
end
