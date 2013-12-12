class ActivityScraper
  require 'open-uri'

  attr_accessor :attraction_data, :activity_data, :name, :type_of_activity, :location, :attraction_picture, :activity_picture, :attraction_description, :activity_description, :price

  def initialize
    
  end

  def find_cities_activity
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = "Seattle, USA"  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 
    puts "Loaded search results! #{page.title}"

    page = page.link_with(:href => /\/Tourism\S*/).click
    puts "Loaded city! #{page.title}"

    
    attraction_link = "http://www.tripadvisor.com"+ page.link_with(:text => "\nThings to Do\n").href
    puts "got attraction link! #{attraction_link}"

    @attraction_data = Nokogiri::HTML(open(attraction_link))
    a = 0
    while a <= 9
      puts @attraction_data.css("a.property_title")[a].text
      a+=1
    end

    @attraction_description = Nokogiri::HTML(open(attraction_link))
    d = 0
    while d <= 9
      puts @attraction_description.css(".onHide")[d].text
      d+=1
    end
    puts ""

    # binding.pry
    @attraction_picture = Nokogiri::HTML(open(attraction_link))
    i = 0
    while i <= 9
      puts @attraction_picture.css(".photo_image")[i].to_a[0][1]
      i+=1
    end  

    activity_link = "http://www.tripadvisor.com"+ @attraction_data.css("h2#ACTIVITIES_TAB a").first.attr("href")
    puts "got activity link! #{activity_link}"

    @activity_data = Nokogiri::HTML(open(activity_link))
    b = 0
    while b <= 9
      puts @activity_data.css("a.property_title")[b].text
      b+=1
    end

    @activity_picture = Nokogiri::HTML(open(activity_link))
    c = 0
    while c <= 9
      puts @activity_picture.css(".photo_image")[c].to_a[0][1]
      c+=1
    end  

  end
end