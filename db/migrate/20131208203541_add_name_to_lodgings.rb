class AddNameToLodgings < ActiveRecord::Migration
  def change
    add_column :lodgings, :name, :string
  end
end
