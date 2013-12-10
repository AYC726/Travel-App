require 'spec_helper'

describe Flight do
 it "is valid with a depart_date, return_date, flying_from, flying_to" do
    delta = Flight.new
    delta.depart_date = "September 23, 2013"
    delta.return_date = "December 23, 2013"
    delta.flying_from = "JFK"
    delta.flying_to = "EZE"
    expect(delta).to be_valid
  end

  it "is invalid without a depart_date" do
    expect(Flight.new(depart_date: nil )).to have(1).errors_on(:depart_date)
  end
  it "is invalid without a country" do
    expect(Flight.new(return_date: nil )).to have(1).errors_on(:return_date)
  end

  it "is invalid without a flying_from" do
    expect(Flight.new(flying_from: nil )).to have(1).errors_on(:flying_from)
  end

  it "is invalid without a flying_to" do
    expect(Flight.new(flying_to: nil )).to have(1).errors_on(:flying_to)
  end

end
