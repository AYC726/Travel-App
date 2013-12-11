class LodgingScraper
  require 'open-uri'

  attr_accessor :name, :type_of_lodging, :location, :picture, :description, :price

  def initialize
    
  end

  def find_cities_hostel
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = "Brooklyn, USA"  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 
    puts "Loaded search results! #{page.title}"

    page = page.link_with(:href => /\/Tourism\S*/).click
    puts "Loaded city! #{page.title}"

    page = page.link_with(:href => /\/Hotels\S*/).click
    puts "Loaded hotels! #{page.title}"

    page = page.link_with(:text => "All specialty lodgings").click
    puts "Loaded! #{page.title}"

    page = page.link_with(:text => "Hostel").click
    puts "Loaded! #{page.title}"

  end
end