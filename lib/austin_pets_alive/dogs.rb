class AustinPetsAlive::Dogs
attr_accessor :name, :breed, :sex, :age, :url


  def self.today
    #scrape dogs from Austin pets alive
    self.scrape_dogs
  end

  def self.scrape_dogs
    dog_index = Nokogiri::HTML(open("https://www.austinpetsalive.org/adopt/dogs/"))
    scraped_dogs = []
    #iterate over each
    dog_index.css("li.pet").each do |dog|
      current_dog = self.new
      current_dog.name = dog.css("a").attribute("title").value
      @details = dog.at('p:contains("ale")').text.strip.split(/\n/)
      current_dog.age = @details[3].to_s
      current_dog.breed = @details[2].to_s
      current_dog.sex = @details[1].to_s
      current_dog.url = dog.css("a").attribute("href").value
      scraped_dogs << current_dog
    end
    scraped_dogs
  end

  #def self.scrape_dogs
   # dogs = []
    #dog_index = Nokogiri::HTML(open("https://www.austinpetsalive.org/adopt/dogs/"))
    #dog_1 = self.new
    #dog_1.name = dog_index.css("ul.available_pets_table.li.a.title").text
    #dog_1.breed = "Lab"
    #dog_1.age = "4 years"  # text representation
    #dog_1.url = "http://austinpetsalive.org"


    #dog_2 = self.new
    #dog_2.name = "Pablo"
   # dog_2.breed = "Beagle Mix"
  #  dog_2.age = "4 months"  # text representation
 #   dog_2.url = "http://austinpetsalive.org"
#
   # dogs = [dog_1, dog_2]
  #end
end