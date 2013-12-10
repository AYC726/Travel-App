require 'spec_helper'

describe Restaurant do
  it "is valid with a name, description, photo, price and location" do
    newyork = Location.new
    newyork.city = "new york"
    newyork.country = "USA"
    japanese = Restaurant.new
    japanese.name = "Nobu"
    japanese.description = "sushi and sake" 
    japanese.photo = "www.photo.com"
    japanese.price = "5.50"
    japanese.location = newyork
    expect(japanese).to be_valid
  end

  it "is invalid without a name" do
    expect(Restaurant.new(name: nil )).to have(1).errors_on(:name)
  end

  it "is invalid without a description" do
    expect(Restaurant.new(description: nil )).to have(1).errors_on(:description)
  end

  it "is invalid without a photo" do
    expect(Restaurant.new(photo: nil )).to have(1).errors_on(:photo)
  end

  it "is invalid without a price" do
    expect(Restaurant.new(price: nil )).to have(1).errors_on(:price)
  end

  it "is invalid without a location" do
    expect(Activity.new(location: nil )).to have(1).errors_on(:location)
  end
end
