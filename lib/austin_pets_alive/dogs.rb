class AustinPetsAlive::Dogs
  attr_accessor :name, :breed, :sex, :age, :url

  def self.today
    # scrape dogs from Austin pets alive
    scrape_dogs
  end

  def self.scrape_dogs
    dog_index = Nokogiri::HTML(open('https://www.austinpetsalive.org/adopt/dogs/'))
    @@scraped_dogs = []
    # iterate over each
    dog_index.css('li.pet').each do |dog|
      current_dog = new
      current_dog.name = dog.css('a').attribute('title').value
      current_dog.url = "https://www.austinpetsalive.org#{dog.css('a').attribute('href').value}"
      @details = dog.at('p:contains("ale")').text.strip.split(/\n/)
      current_dog.age = @details[3].to_s
      current_dog.breed = @details[2].to_s
      current_dog.sex = @details[1].to_s
      @@scraped_dogs << current_dog
    end
    @@scraped_dogs[0,10]
  end
end
