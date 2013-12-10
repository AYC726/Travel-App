class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.string :price
      t.integer :location_id

      t.timestamps
    end
  end
end
