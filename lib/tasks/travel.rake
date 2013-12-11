namespace :scrape do
  
  task :lodging => :environment do
    puts "Scraping lodging..."
    scraper = LodgingScraper.new
    scraper.find_cities_hostel
  end

  task :restaurant => :enviroment do
    puts "Scraping restaurant..."
    scraper = RestaurantScraper.new
    scraper.find_cities_restaurant
  end
end