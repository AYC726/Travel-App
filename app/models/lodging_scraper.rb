class LodgingScraper
  require 'open-uri'
  include Capybara::DSL

  attr_accessor :lodging_data, :name, :url, :type_of_lodging, :location, :picture, :description, :price

  def initialize
    if File.exist?("lib/assets/hw-lodging.txt")
      puts "... loading from file"
      @lodging_data = Nokogiri::HTML.parse(File.open("lib/assets/hw-lodging.txt"))
    else
      puts "... scraping hostelworld "
      Capybara.current_driver = :webkit
      visit(build_hostelworld_search_url("Dublin", "Ireland"))
      @lodging_data = Nokogiri::HTML.parse(body)

      f = File.open("lib/assets/hw-lodging.txt", "w")
      f << @lodging_data
      f.close
    end
  end

  def build_hostelworld_search_url(city, country)
    #http://www.hostelworld.com/search?search_keywords=New+York%2C+USA&country=USA&city=New-York&date_from=2014-03-12&date_to=2014-03-13
    #http://www.hostelworld.com/search?search_keywords=Dublin%2C+Ireland&country=Ireland&city=Dublin&date_from=2014-03-12&date_to=2014-03-13
    "http://www.hostelworld.com/search?search_keywords=#{city}%2C+#{country}&country=#{country}&city=#{city}&date_from=2014-03-12&date_to=2014-03-14"
  end

  def run
    (0..9).each do |i|
      print "#{i+1}. "
      pp Lodging.create(
        name: get_lodging_name(@lodging_data.css("div.fabdetails ul li h2 a")[i]),
        url: get_lodging_link(@lodging_data.css("div.fabdetails ul li h2 a")[i]),
        picture: get_lodging_picture(@lodging_data.css("div.fabresultimage img")[i]),
        type_of_lodging: get_lodging_type(@lodging_data.css("div.fabresultimage span")[i]),
        price: get_lodging_price(@lodging_data.css("div.fabpricing ul")[i]),
        location_id: 35
      )
      puts ""
    end
  end

  def get_lodging_name(nokogiri_obj)
    nokogiri_obj.text.strip
  end

  def get_lodging_link(nokogiri_obj)
    nokogiri_obj.attr("href").strip
  end

  def get_lodging_picture(nokogiri_obj)
    small_img = nokogiri_obj.attr("src").strip
    small_img.gsub("_s.jpg", ".jpg")
  end

  def get_lodging_price(nokogiri_obj)
    nokogiri_obj.css("span.fabprice").map do |price|
      price.text.strip.gsub("US$", "").to_f
    end.sort.first
  end

  def get_lodging_type(nokogiri_obj)
    nokogiri_obj.text.strip.downcase
  end
end