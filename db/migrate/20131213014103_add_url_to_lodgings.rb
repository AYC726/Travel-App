class AddUrlToLodgings < ActiveRecord::Migration
  def change
    add_column :lodgings, :url, :string
    add_column :lodgings, :picture, :string
  end
end
