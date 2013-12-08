class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
    	t.string :type_of_lodging
    	t.float :price
    	t.integer :location_id


      t.timestamps
    end
  end
end
