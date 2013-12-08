class Location < ActiveRecord::Base
  validates :city, :country, presence: true
end
