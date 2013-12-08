require 'spec_helper'

describe Lodging do
	it "is valid with a name, type_of_lodging and location" do
		hotel = Lodging.new
		hotel.name = "holiday inn"
		hotel.type_of_lodging = "hotel" 
		expect(hotel).to be_valid
	end
	it "is invalid without a name"
	it "is invalid without a type_of_lodging"
	it "is invalid without a location"
end
