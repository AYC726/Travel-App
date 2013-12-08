class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.integer :duration
    	t.integer :location_id 
    	t.float :budget



      t.timestamps
    end
  end
end
