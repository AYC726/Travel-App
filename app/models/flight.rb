class Flight < ActiveRecord::Base
  validates :depart_date, presence: true  
  validates :return_date, presence: true 
  validates :flying_from, presence: true 
  validates :flying_to, presence: true 
end
