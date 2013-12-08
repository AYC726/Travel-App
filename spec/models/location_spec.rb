require 'spec_helper'

describe Location do
	it "is valid with city and country" do
		newyork = Location.new
		newyork.city = "new york"
		newyork.country = "USA" 
		expect(newyork).to be_valid
	end
 	it "is invalid without a city" do
 		expect(Location.new(city: nil )).to have(1).errors_on(:city)
 	end
	it "is invalid without a country" do
		expect(Location.new(country: nil )).to have(1).errors_on(:country)
	end
end
