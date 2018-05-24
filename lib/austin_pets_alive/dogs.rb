class AustinPetsAlive::Dogs
attr_accessor :name, :breed, :age, :url


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
      current_dog.age = dog.css("h3.p").text
      current_dog.breed = "Dog"
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