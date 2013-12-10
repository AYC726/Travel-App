class LodgingScraper
  require 'open-uri'

  attr_accessor :name, :type_of_lodging, :location, :picture, :description, :price

  def initialize
    
  end

  def find_cities_hostel
    agent = Mechanize.new
    page = agent.get("http://www.tripadvisor.com/") #enter tripadvisor
    tripadvisor_form = page.form
    tripadvisor_form.q = 'Brooklyn, USA'  #input city and country
    page = agent.submit(tripadvisor_form) #submit the form 

    page = agent.page.link_with(:href => /\/Tourism\S*/).click
    page = agent.submit(tripadvisor_form)
    puts "loading for hotels"

    page = agent.page.link_with(:href => /\/Hotels\S*/).click
    page = agent.submit(tripadvisor_form)
    puts "loading for Specialty Lodging"


    page = agent.page.link_with(:text => '<b>Specialty Lodging</b>').click
    page = agent.submit(tripadvisor_form)
    puts "loading for hostel"

    page = agent.page.link_with(:text => 'Hostel').click
    page = agent.submit(tripadvisor_form)



  end

end