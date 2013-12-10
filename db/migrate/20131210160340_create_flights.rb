class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :depart_date
      t.string :return_date
      t.string :flying_from
      t.string :flying_to

      t.timestamps
    end
  end
end

