require 'spec_helper'

describe Trip do
	it "is valid with a duration, budget, location" do
    newyork = Location.new
    newyork.city = "new york"
    newyork.country = "USA"
    newyork.save
    nyctrip = Trip.new
    nyctrip.duration = 5
    nyctrip.budget = 2000
    nyctrip.location = newyork

    expect(nyctrip).to be_valid
  end
	it "is invalid without a duration"
	it "is invalid without a location"
	it "accepts days for duration"
end
