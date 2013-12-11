class LodgingScraper
  require 'open-uri'

  attr_accessor :lodging_data, :name, :type_of_lodging, :location, :picture, :description, :price

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

    hostel_link = "http://www.tripadvisor.com"+ page.link_with(:text => "Hostel").href
    puts "got hostel link! #{hostel_link}"

    @lodging_data = Nokogiri::HTML(open(hostel_link))
    puts @lodging_data.css("a.property_title").text
    binding.pry
    puts @lodging_data.css("a.photo_link img").text


  end
end