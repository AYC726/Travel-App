class Lodging < ActiveRecord::Base
  belongs_to :location 
  validates :type_of_lodging, :name, presence: true  
  validates :location, presence: true  
end
