class Restaurant < ActiveRecord::Base
  belongs_to :location 
  validates :name, :description, :photo, :price, presence: true  
  validates :location, presence: true  
end
