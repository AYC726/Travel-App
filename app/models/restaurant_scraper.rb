class RestaurantScraper
   require 'open-uri'

   attr_accessor :restaurant_data, :name, :type_of_restaurant, :location, :picture, :description, :price

   def find_cities_restaurant
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = "Brooklyn, USA"  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 
    puts "Loaded search results! #{page.title}"

    page = page.link_with(:href => /\/Tourism\S*/).click
    puts "Loaded city! #{page.title}"

    restaurant_link = "http://www.tripadvisor.com"+ page.link_with(:text => "\nRestaurants\n").href
    puts "Got restaurants link! #{restaurant_link}"

    @restaurant_data = Nokogiri::HTML(open(restaurant_link))
    puts @restaurant_data.css("a.property_title").text

  end
end
