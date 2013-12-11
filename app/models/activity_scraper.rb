class ActivityScraper
  require 'open-uri'

  attr_accessor :attraction_data, :name, :type_of_activity, :location, :picture, :description, :price

  def initialize
    
  end

  def find_cities_activity
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = "Brooklyn, USA"  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 
    puts "Loaded search results! #{page.title}"

    page = page.link_with(:href => /\/Tourism\S*/).click
    puts "Loaded city! #{page.title}"

    attraction_link = "http://www.tripadvisor.com"+ page.link_with(:text => "\nThings to Do\n").href
    puts "got attraction link! #{attraction_link}"

    @attraction_data = Nokogiri::HTML(open(attraction_link))
    puts @attraction_data.css("a.property_title").text
      
  end
end