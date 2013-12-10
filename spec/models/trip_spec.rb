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
	
  it "is invalid without a duration" do
    expect(Trip.new(duration: nil )).to have(2).errors_on(:duration)
  end
	
  it "is invalid without a location" do
    expect(Trip.new(location: nil )).to have(1).errors_on(:location)
  end

	it "accepts days for duration" do
    expect(Trip.new(duration: 5.5)).to have(1).errors_on(:duration)
  end

end
