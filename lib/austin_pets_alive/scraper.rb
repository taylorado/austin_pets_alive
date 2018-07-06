class AustinPetsAlive::Scraper



  def self.scrape_dogs
    dog_index = Nokogiri::HTML(open('https://www.austinpetsalive.org/adopt/dogs/'))
    # iterate over each
    dog_index.css('li.pet').each do |dog|

      name = dog.css('a').attribute('title').value
      url = "https://www.austinpetsalive.org#{dog.css('a').attribute('href').value}"
      @details = dog.at('p:contains("ale")').text.strip.split(/\n/)
      age = @details[3].to_s
      breed = @details[2].to_s
      sex = @details[1].to_s
      AustinPetsAlive::Dogs.new(name, breed, sex, age, url)
      end
  end


end