class Trip < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :location, :duration
  validates :duration, numericality: {only_integer: true}
end
