class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type_of_activity
      t.string :name
      t.string :description
      t.string :photo
      t.string :price
      t.integer :location_id

      t.timestamps
    end
  end
end
