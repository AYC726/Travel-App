class Activity < ActiveRecord::Base
  belongs_to :location 
  validates :type_of_activity, presence: true  
  validates :name, presence: true 
  validates :description, presence: true 
  validates :photo, presence: true 
  validates :price, presence: true  
  validates :location, presence: true  
end
