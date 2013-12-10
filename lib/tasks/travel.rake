namespace :travel do
  task :lodging => :environment do
    puts "Scraping lodging..."

    scraper = LodgingScraper.new
    scraper.find_cities_hostel
      # go through 150 cities (Stay.com)


      # TODO
      
      # mechanize: search for "Hong Kong, China"
      # mechanize: click on "Hong Kong, China"
      # mechanize: click "All Hotels"
      # mechanize: click "Hostel"
      # scrape tripadvisor for top 10 hostels
      # save that data to database

  end
end