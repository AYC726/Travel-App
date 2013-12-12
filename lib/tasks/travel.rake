namespace :scrape do
  
  task :lodging => :environment do
    puts "Scraping lodging..."
    scraper = LodgingScraper.new
    scraper.run
  end

  task :restaurant => :environment do
    puts "Scraping restaurant..."
    scraper = RestaurantScraper.new
    scraper.find_cities_restaurant
  end

  task :activity => :environment do
    puts "Scraping activity..."
    scraper = ActivityScraper.new
    scraper.find_cities_activity
  end

end