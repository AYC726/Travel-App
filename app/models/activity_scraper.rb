class ActivityScraper
  require 'open-uri'

  attr_accessor :attraction_data, :activity_data, :name, :type_of_activity, :location, :picture, :description, :price

  def initialize
    
  end

  def find_cities_activity
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = "Hong Kong, China"  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 
    puts "Loaded search results! #{page.title}"

    page = page.link_with(:href => /\/Tourism\S*/).click
    puts "Loaded city! #{page.title}"

    
    attraction_link = "http://www.tripadvisor.com"+ page.link_with(:text => "\nThings to Do\n").href
    puts "got attraction link! #{attraction_link}"

    @attraction_data = Nokogiri::HTML(open(attraction_link))
    puts @attraction_data.css("a.property_title").text


   
    @picture = Nokogiri::HTML(open(attraction_link))
    i = 0
    while i != 10
      puts @picture.css(".photo_image")[i].to_a[0][1]
      i+=1
    end  

    binding.pry

    activity_link = "http://www.tripadvisor.com"+ @attraction_data.css("h2#ACTIVITIES_TAB a").first.attr("href")
    puts "got activity link! #{activity_link}"

    @activity_data = Nokogiri::HTML(open(activity_link))
    puts @activity_data.css("a.property_title").text
      
  end
end