require 'spec_helper'

describe Activity do
  it "is valid with a name, description, photo, price, type_of_activity and location" do
    newyork = Location.new
    newyork.city = "new york"
    newyork.country = "USA"
    outdoors = Activity.new
    outdoors.name = "scuba diving"
    outdoors.description = "underwater adventure" 
    outdoors.photo = "www.photo.com"
    outdoors.price = "500.50"
    outdoors.type_of_activity = "scuba diving" 
    outdoors.location = newyork
    expect(outdoors).to be_valid
  end

  it "is invalid without a name" do
    expect(Activity.new(name: nil )).to have(1).errors_on(:name)
  end

  it "is invalid without a description" do
    expect(Activity.new(description: nil )).to have(1).errors_on(:description)
  end

  it "is invalid without a description" do
    expect(Activity.new(photo: nil )).to have(1).errors_on(:photo)
  end

  it "is invalid without a description" do
    expect(Activity.new(price: nil )).to have(1).errors_on(:price)
  end

  it "is invalid without a type_of_activity" do
    expect(Activity.new(type_of_activity: nil )).to have(1).errors_on(:type_of_activity)
  end

  it "is invalid without a location" do
    expect(Activity.new(location: nil )).to have(1).errors_on(:location)
  end
end
