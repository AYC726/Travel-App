require 'spec_helper'

describe Lodging do
	it "is valid with a name, type_of_lodging and location" do
    newyork = Location.new
    newyork.city = "new york"
    newyork.country = "USA"
		hotel = Lodging.new
		hotel.name = "holiday inn"
		hotel.type_of_lodging = "hotel" 
    hotel.location = newyork
		expect(hotel).to be_valid
	end

	it "is invalid without a name" do
    expect(Lodging.new(name: nil )).to have(1).errors_on(:name)
  end

	it "is invalid without a type_of_lodging" do
    expect(Lodging.new(type_of_lodging: nil )).to have(1).errors_on(:type_of_lodging)
  end

	it "is invalid without a location" do
    expect(Lodging.new(location: nil )).to have(1).errors_on(:location)
  end
end
