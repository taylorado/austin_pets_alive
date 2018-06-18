class AustinPetsAlive::Dogs
  attr_accessor :name, :breed, :sex, :age, :url

  @@scraped_dogs = []

  def self.scrape_dogs
    dog_index = Nokogiri::HTML(open('https://www.austinpetsalive.org/adopt/dogs/'))
    # iterate over each
    dog_index.css('li.pet').each do |dog|
      current_dog = self.new
      current_dog.name = dog.css('a').attribute('title').value
      current_dog.url = "https://www.austinpetsalive.org#{dog.css('a').attribute('href').value}"
      @details = dog.at('p:contains("ale")').text.strip.split(/\n/)
      current_dog.age = @details[3].to_s
      current_dog.breed = @details[2].to_s
      current_dog.sex = @details[1].to_s
      @@scraped_dogs  << current_dog
    end
    self.all
  end

  def self.show_dog(input)
    if input <= @@scraped_dogs.count
      puts "#{@@scraped_dogs[input].name} is a #{@@scraped_dogs[input].age} old #{@@scraped_dogs[input].sex} #{@@scraped_dogs[input].breed}"
      puts "More Information: #{@@scraped_dogs[input].url}"
      puts "Enter the number of the dog you would like more information on.  Type 'next' to see the next 10 dogs.  Type 'exit' to exit"
    else
      puts "That number doesn't exist - there are only #{@@scraped_dogs.count} dogs on the list.  Enter the number of the dog you would like more information on.  Or type 'exit' to exit"
    end
  end

  def self.all
    @@scraped_dogs
  end

end
